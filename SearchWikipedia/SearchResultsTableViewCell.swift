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
        //        if let imgUrl = imageUrl, imgUrl.count > 0 {
        //            DispatchQueue.global(qos: .default).async {//concuurent
        //                let url = URL.init(string: imgUrl)
        //                do {
        //                    let data = try Data.init(contentsOf: url!)
        //                    DispatchQueue.main.async {
        //                        self.searchedImage?.image = UIImage.init(data: data)
        //                    }
        //                } catch {
        //                    print("Failed")
        //                }
        //            }
        //        }
        //        if let imgUrl = imageUrl, imgUrl.count > 0 {
        //            let queue = DispatchQueue(label: "SerialQueue")//serial
        //            queue.async {
        //
        //                let url = URL.init(string: imgUrl)
        //                do {
        //                    let data = try Data.init(contentsOf: url!)
        //                    DispatchQueue.main.async {
        //                        self.searchedImage?.image = UIImage.init(data: data)
        //                    }
        //                } catch {
        //                    print("Failed")
        //                }
        //            }
        //        }
        //        if let imgUrl = imageUrl, imgUrl.count > 0 {
        //            for  i  in 1...5 {
        //                DispatchQueue.global(qos: .background).sync {
        //                    let url = URL.init(string: imgUrl)
        //                    do {
        //                        let data = try Data.init(contentsOf: url!)
        //                        DispatchQueue.main.async {
        //                            self.searchedImage?.image = UIImage.init(data: data)
        //                        }
        //                    } catch {
        //                        print("Failed")
        //                    }
        //                }
        //            }
        //        }
        
        if let imgUrl = imageUrl, imgUrl.count > 0 {
             for  i  in 1...5 {
                let concurrentQueue = DispatchQueue.init(label: "sdds", attributes: .concurrent)
                let sds = DispatchQueue.init(label: "sdsd", qos: .default, attributes: .concurrent, autoreleaseFrequency: .never, target: DispatchQueue.)
           
            concurrentQueue.async {
                
                let url = URL.init(string: imgUrl)
                do {
                    let data = try Data.init(contentsOf: url!)
                    DispatchQueue.main.async {
                        self.searchedImage?.image = UIImage.init(data: data)
                    }
                } catch {
                    print("Failed")
                }
            }
        }
    }
    }
}

