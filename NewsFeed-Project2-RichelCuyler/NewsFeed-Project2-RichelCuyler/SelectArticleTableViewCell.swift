//
//  SelectArticleTableViewCell.swift
//  NewsFeed-Project2-RichelCuyler
//
//  Created by Richel Cuyler on 12/9/16.
//  Copyright © 2016 Richel Cuyler. All rights reserved.
//

import UIKit

class SelectArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var articleHeadline: UILabel!
    @IBOutlet weak var articleDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
