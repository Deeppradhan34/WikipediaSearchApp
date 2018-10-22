//
//  SearchResultsTableViewCell.swift
//  WikipediaSearchApp
//
//  Created by DEEP PRADHAN on 21/10/18.
//  Copyright © 2018 DEEP PRADHAN. All rights reserved.
//

import UIKit

class SearchResultsTableViewCell: UITableViewCell {
    
    @IBOutlet weak var searchedDescription: UILabel!
    @IBOutlet weak var searchedTitle: UILabel!
    @IBOutlet weak var searchedImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    func configureCell(data: Pages?) {
        let imageUrl = data?.imageUrl as? String
        downloadImage(imageUrl: imageUrl)
        self.searchedTitle.text = data?.title
    }
    
    func downloadImage(imageUrl: String?) {
        if let imgUrl = imageUrl, imgUrl.count > 0 {
            let url = URL.init(string: imgUrl)
            do {
                let data = try Data.init(contentsOf: url!)
                DispatchQueue.main.async {
                    self.imageView?.image = UIImage.init(data: data)
                }
            } catch {
                print("Failed")
            }
        }
    }
}
