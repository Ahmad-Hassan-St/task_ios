//
//  TemplateCollectionViewCell.swift
//  task
//
//  Created by Ios Dev on 10/4/24.
//

//import UIKit
//
//import UIKit
//
//class TemplateCollectionViewCell: UICollectionViewCell {
//    @IBOutlet weak var imageView: UIImageView!
//    @IBOutlet weak var backView: UIView!
//    override func awakeFromNib() {
//        super.awakeFromNib()
//        
//        if UIDevice.current.userInterfaceIdiom == .pad {
////            backView.layer.cornerRadius = backView.frame.size.width
//        }
//        else{
////            backView.layer.cornerRadius = backView.frame.size.width/2
//            
//        }
//        backView.clipsToBounds = true
//        
//    }
//}

//class TemplateCollectionViewCell: UICollectionViewCell {
//    
//    
//    
//    // Initialize imageView programmatically
//    let imageView: UIImageView = {
//        let imageView = UIImageView()
//        imageView.translatesAutoresizingMaskIntoConstraints = false
//        return imageView
//    }()
//    
//    let proImage: UIImageView = {
//          let proImage = UIImageView()
//          proImage.image = UIImage(named: "sproi")
//          proImage.translatesAutoresizingMaskIntoConstraints = false
//          return proImage
//      }()
//    
//    
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        contentView.addSubview(imageView)
//        contentView.addSubview(proImage)
//
//        setupConstraints()
//    }
//    
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    private func setupConstraints() {
//        NSLayoutConstraint.activate([
//            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
//        ])
//        
//        NSLayoutConstraint.activate([
//                 proImage.topAnchor.constraint(equalTo: contentView.topAnchor),
//                 proImage.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
////                 proImage.heightAnchor.constraint(equalToConstant: 20), // Set desired height
////                 proImage.widthAnchor.constraint(equalToConstant: 20)   // Set desired width
//             ])
//    }
//}

