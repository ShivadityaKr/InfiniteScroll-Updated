//
//  CustomTVC.swift
//  Pagnination fetch api
//
//  Created by Shivaditya Kumar on 16/02/22.
//

import UIKit
import SDWebImage
import Nuke
class CustomTVC: UITableViewCell {
    
    @IBOutlet weak var imageViewForCell: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    var tempURl : String!
    
    @IBAction func downloadButtonTap(_ sender: Any) {
        
        UIApplication.shared.openURL(NSURL(string: tempURl)! as URL)
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
    }
    var datasource : ImageListResponseElement?
    //private let imageCache = NSCache<AnyObject, UIImage>()
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        
    }
    func setData(data : ImageListResponseElement) {
        self.datasource = data
        self.titleLabel.text = data.author
        self.tempURl = data.downloadURL
        
        //        let url = URL(string: String(data.downloadURL))!
        
        
        if self.imageViewForCell.image == nil {
            self.imageViewForCell.image = UIImage(named: "photo.artframe")
        }
        //sd webimage
        DispatchQueue.global().async {
            let imageURL : NSURL? = NSURL(string: data.downloadURL)
           
            if (try? Data(contentsOf: imageURL! as URL)) != nil{
                DispatchQueue.main.async {
                    Nuke.loadImage(with: imageURL as URL?, into: self.imageViewForCell)
                    
//                    self.imageViewForCell.sd_setImage(with: imageURL as URL?)
                }
            }

        }
        
        //traditional way
        //        if let cachedImage = self.imageCache.object(forKey: url as AnyObject){
        //            debugPrint("image is loaded from cache !!")
        //            self.imageViewForCell.image = cachedImage
        //            return
        //        }
        //        DispatchQueue.global().async {
        //                // Fetch Image Data
        //                if let data = try? Data(contentsOf: url) {
        //                    DispatchQueue.main.async {
        //                        // Create Image and Update Image View
        //                        debugPrint("image is downloaded")
        //                        self.imageCache.setObject(self.imageViewForCell.image!, forKey: url as AnyObject)
        //                        self.imageViewForCell.image = UIImage(data: data)
        //
        //                    }
        //                }
        //            }
    }
    
}
