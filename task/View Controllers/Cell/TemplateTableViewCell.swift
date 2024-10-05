////
////  TemplateTableViewCell.swift
////  task
////
////  Created by Ios Dev on 10/4/24.
////
//
//import UIKit
//
//class TemplateTableViewCell: UITableViewCell {
//    @IBOutlet weak var lblCategory: UILabel!
//    @IBOutlet weak var backContainer: UIView!
//    @IBOutlet weak var collectionView: UICollectionView!
//    
//    @IBOutlet weak var lblSeeAll: UILabel! // later on make gesture detecto for navigation
//    var category: Int?
//    var selectedItem: Int?
//
//    
//   
//    var images: [String] = [] {
//        didSet {
//            collectionView.reloadData()
//        }
//    }
//    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        backContainer.layer.cornerRadius = 16
//        
//        collectionView.dataSource = self
//        collectionView.delegate = self
//        collectionView.showsHorizontalScrollIndicator = false
//        collectionView.showsVerticalScrollIndicator = false
//
//        
//        let nib = UINib(nibName: "SleepAndMusicCell", bundle: nil)
//           collectionView.register(nib, forCellWithReuseIdentifier: "SleepAndMusicCell")
//
//    
//
//    }
//}
//extension TemplateTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return images.count
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SleepAndMusicCell", for: indexPath) as! SleepAndMusicCell
//
//        let imageName = images[indexPath.item]
//        if let image = UIImage(named: imageName) {
//            cell.celebrateImage.image = image
//        } else {
//            print("Image not found: \(imageName)")
//            cell.celebrateImage.image = nil // Optionally, set a placeholder image here
//        }
//        
//          if indexPath.item % 2 != 0 {
//              cell.lockImage.image = UIImage(named: "sproi")
//              cell.lockImage.isHidden = false
//          } else {
//              cell.lockImage.isHidden = true
//          }
//        
//        
//        return cell
//        
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        
//        var width: CGFloat
//        var height: CGFloat
//        
//        if lblCategory.text == "Featured" {
//            // Define the base width and height for "Featured" category
//            width = UIDevice.current.userInterfaceIdiom == .pad ? 300 : UIScreen.main.nativeBounds.height >= 2500 ? 190 : 150
//            height = UIDevice.current.userInterfaceIdiom == .pad ? 200 : 100
//        } else {
//            // Define the base width and height for other categories
//            width = UIDevice.current.userInterfaceIdiom == .pad ? 200 : 100
//            height = UIDevice.current.userInterfaceIdiom == .pad ? 240 : 120
//        }
//        
//        // Check if the device has a screen height >= 2500 (e.g., iPhone 15)
//        if UIScreen.main.nativeBounds.height >= 2500 {
//            width += 20
//            height += 35
//        }
//        
//        return CGSize(width: width, height: height)
//    }
//
//}
//



import UIKit

class TemplateTableViewCell: UITableViewCell {
    @IBOutlet weak var lblCategory: UILabel!
    @IBOutlet weak var backContainer: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var lblSeeAll: UILabel!
    
    var category: Int?
    var selectedItem: Int?
    
    var images: [String] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backContainer.layer.cornerRadius = 16
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.showsVerticalScrollIndicator = false
        
        let nib = UINib(nibName: "SleepAndMusicCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: "SleepAndMusicCell")
        
        // Add tap gesture for lblSeeAll
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(lblSeeAllTapped))
        lblSeeAll.isUserInteractionEnabled = true
        lblSeeAll.addGestureRecognizer(tapGesture)
    }
    
    @objc func lblSeeAllTapped() {
        print("See All tapped!")
    }
}

extension TemplateTableViewCell: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SleepAndMusicCell", for: indexPath) as! SleepAndMusicCell
        
        let imageName = images[indexPath.item]
        if let image = UIImage(named: imageName) {
            cell.celebrateImage.image = image
        } else {
            print("Image not found: \(imageName)")
            cell.celebrateImage.image = nil
        }
        
        // Apply fade-in animation
        cell.alpha = 0
        UIView.animate(withDuration: 0.5, delay: 0.1 * Double(indexPath.item), options: [.curveEaseIn], animations: {
            cell.alpha = 1
            cell.transform = CGAffineTransform(scaleX: 1.1, y: 1.1)
        }) { _ in
            UIView.animate(withDuration: 0.3) {
                cell.transform = CGAffineTransform.identity
            }
        }
        
        // Lock icon logic
        if indexPath.item % 2 != 0 {
            cell.lockImage.image = UIImage(named: "sproi")
            cell.lockImage.isHidden = false
        } else {
            cell.lockImage.isHidden = true
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var width: CGFloat
        var height: CGFloat
        
        if lblCategory.text == "Featured" {
            width = UIDevice.current.userInterfaceIdiom == .pad ? 300 : UIScreen.main.nativeBounds.height >= 2500 ? 190 : 150
            height = UIDevice.current.userInterfaceIdiom == .pad ? 200 : 100
        } else {
            width = UIDevice.current.userInterfaceIdiom == .pad ? 200 : 100
            height = UIDevice.current.userInterfaceIdiom == .pad ? 240 : 120
        }
        
        if UIScreen.main.nativeBounds.height >= 2500 {
            width += 20
            height += 35
        }
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // Handle item selection
    }
}
