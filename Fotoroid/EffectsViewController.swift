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
    lazy var filterManager: FilterManager = {
        let filterManager = FilterManager(image: image)
        return filterManager
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        ivPhoto.image = image
    }
    
    func applyPhotoEffect(with filterType: FilterType){
        ivPhoto.image = filterManager.applyFilter(type: filterType)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}

extension EffectsViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return FilterType.allValues.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FilterTypeCollectionViewCell
        
        cell.image.image = UIImage(named: FilterType.allValues[indexPath.row])
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        applyPhotoEffect(with: FilterType(rawValue: indexPath.row)!)
    }
}
