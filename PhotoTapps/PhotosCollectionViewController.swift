//
//  PhotosCollectionViewController.swift
//  PhotoTapps
//
//  Created by Андрей on 03.10.2023.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {
    
    // Массив названий фото
    let photos = ["dog1", "dog2", "dog3", "dog4", "dog5", "dog6", "dog7", "dog8", "dog9", "dog10", "dog11", "dog12", "dog13", "dog14", "dog15"]
    
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)

    override func viewDidLoad() {
        super.viewDidLoad()
//        let layout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        
//        layout.itemSize = CGSize(width: 70, height: 70)
//        layout.sectionInset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//        layout.minimumLineSpacing = 20
//        layout.minimumInteritemSpacing = 20
//        collectionView.showsVerticalScrollIndicator = false

//        let paddingWidth = sectionInsets.left * (itemsPerRow + 1)
//        let availableWidth = collectionView.frame.width - paddingWidth - 1
//        let widthPerItem = availableWidth / itemsPerRow
//        layout.itemSize = CGSize(width: widthPerItem, height: widthPerItem)
//        layout.sectionInset = sectionInsets
//        layout.minimumLineSpacing = sectionInsets.left
//        layout.minimumInteritemSpacing = sectionInsets.left
//        collectionView.showsVerticalScrollIndicator = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pickPhotoSegue" {
            let destinationVC = segue.destination as! PhotoViewController
            let cell = sender as! PhotoCell
            destinationVC.image = cell.dogImageView.image
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath) as! PhotoCell
        
        let imageName = photos[indexPath.item]
        let image = UIImage(named: imageName)
        
        cell.dogImageView.image = image
//      cell.backgroundColor = .black
    
        return cell
    }
}


 extension PhotosCollectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let paddingWidth = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingWidth - 1
        let widthPerItem = availableWidth / itemsPerRow
        
        return CGSize(width: widthPerItem, height: widthPerItem)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return sectionInsets
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return sectionInsets.left
    }
}


