import UIKit

class CustomCollectionView: UICollectionViewCell {
    
    @IBOutlet weak var celebrateImage: UIImageView!
    @IBOutlet weak var lockImage: UIImageView!
    
   

    public func celebrateSleep(image: UIImage, name: String) {
        celebrateImage.image = image
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        celebrateImage.layer.cornerRadius = 12
        celebrateImage.layer.masksToBounds = true
        }

  
}


