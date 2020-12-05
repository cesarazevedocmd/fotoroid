//
//  EffectsViewController.swift
//  Fotoroid
//
//  Created by César Alves de Azevedo on 05/12/20.
//

import UIKit

class EffectsViewController: UIViewController {
    
    @IBOutlet weak var ivPhoto: UIImageView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var image: UIImage!

    override func viewDidLoad() {
        super.viewDidLoad()
        ivPhoto.image = image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }


}
