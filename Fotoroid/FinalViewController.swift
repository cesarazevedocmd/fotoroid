//
//  FinalViewController.swift
//  Fotoroid
//
//  Created by César Alves de Azevedo on 05/12/20.
//

import UIKit
import Photos

class FinalViewController: UIViewController {

    @IBOutlet weak var ivPhoto: UIImageView!
    var image: UIImage!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ivPhoto.image = image
        ivPhoto.layer.borderWidth = 10
        ivPhoto.layer.borderColor = UIColor.white.cgColor
    }
    
    func saveToAlbum(){
        PHPhotoLibrary.shared().performChanges {
            
            let creationRequest = PHAssetChangeRequest.creationRequestForAsset(from: self.image)
            let addAssetRequest = PHAssetCollectionChangeRequest()
            addAssetRequest.addAssets([creationRequest.placeholderForCreatedAsset!] as NSArray)
            
        } completionHandler: { (success, error) in
            if !success {
                print(error!.localizedDescription)
            } else {
                DispatchQueue.main.async {
                    self.showAlert(title: "Image saved", message: "Your image was saved with success")
                }
            }
        }
    }
    
    @IBAction func save(_ sender: UIButton) {
        PHPhotoLibrary.requestAuthorization { (status) in
            switch status{
                case .authorized:
                    self.saveToAlbum()
                default:
                    self.showAlert(title: "ERROR", message: "You need to allow access to the album to save your photo")
            }
        }
    }
    
    func showAlert(title: String, message: String){
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startAgain(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
