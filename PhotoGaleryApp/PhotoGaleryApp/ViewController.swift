//
//  ViewController.swift
//  PhotoGaleryApp
//
//  Created by woowon on 2022/02/07.
//

import UIKit
import PhotosUI

class ViewController: UIViewController {

    var images = [UIImage?]()
    var fetchResults : PHFetchResult<PHAsset>?
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Phot Galery App"
        
        makeNavigation()
        
        let layout = UICollectionViewFlowLayout()
        
        layout.itemSize = CGSize(width: (UIScreen.main.bounds.width-1)/2, height: UIScreen.main.bounds.width/2)
        
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        photoCollectionView.collectionViewLayout = layout
        
        photoCollectionView.dataSource = self
    }

    
    func  makeNavigation()
    {
        let photoItem = UIBarButtonItem(image: UIImage(systemName: "photo.on.rectangle"), style: .done, target: self, action: #selector(checkPermission))
        
        let refreshItem = UIBarButtonItem(image: UIImage(systemName: "arrow.clockwise"), style: .done, target: self, action: #selector(refresh))
        
        refreshItem.tintColor = .black.withAlphaComponent(0.7)
        photoItem.tintColor = .black.withAlphaComponent(0.7)
        self.navigationItem.rightBarButtonItem = photoItem
        self.navigationItem.leftBarButtonItem = refreshItem
    }
    
    
    @objc func checkPermission()
    {
        //상태 체크
        if PHPhotoLibrary.authorizationStatus() == .authorized ||
            PHPhotoLibrary.authorizationStatus() == .limited
        {
            DispatchQueue.main.async {
                self.showGalery()
            }
        }
        else if PHPhotoLibrary.authorizationStatus() == .denied{
            DispatchQueue.main.async {
                self.showAuthorizationDeniedAlert()
            }
        }
        else if PHPhotoLibrary.authorizationStatus() == .notDetermined{
            PHPhotoLibrary.requestAuthorization { status in
                self.checkPermission()
                print(status)
            }
        }
    }
    
    func showAuthorizationDeniedAlert(){
        let alert = UIAlertController(title: "please, permit", message: nil, preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "닫기", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "설정으로 가기", style: .default, handler: {
            action in
            
            guard let url = URL(string:UIApplication.openSettingsURLString) else{
                return
            }
            if UIApplication.shared.canOpenURL(url){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        }))
        
        
        self.present(alert, animated: true, completion: nil)
    }
    
    func showGalery(){
        let library = PHPhotoLibrary.shared()
        
        var config = PHPickerConfiguration(photoLibrary: library)
        config.selectionLimit = 10
        
        let picker = PHPickerViewController(configuration: config)
        picker.delegate = self
        present(picker, animated: true, completion: nil)
        
    }
    
    @objc func refresh()
    {
        self.photoCollectionView.reloadData()
    }
    
}
extension ViewController : UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return fetchResults?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCell", for: indexPath) as! PhotoCell
        
        if let asset = self.fetchResults?[indexPath.row]{
            cell.loadImage(asset: asset)
        }
        
        return cell
    }
}

extension ViewController : PHPickerViewControllerDelegate{
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        let  identifiers = results.map{
            $0.assetIdentifier ?? ""
        }
        self.fetchResults = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        
        self.photoCollectionView.reloadData()
        
        self.dismiss(animated: true, completion: nil)
    }
}
