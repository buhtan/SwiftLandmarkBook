

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var comesImages: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    
    var selectedLandmarkNames = ""
    var selectedLandmarkImages = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        comesImages.image = selectedLandmarkImages
        titleLabel.text = selectedLandmarkNames
        

        
    }
    


}
