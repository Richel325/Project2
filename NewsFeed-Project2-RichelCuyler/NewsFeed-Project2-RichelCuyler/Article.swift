//
//  Article.swift
//  NewsFeed-Project2-RichelCuyler
//
//  Created by Richel Cuyler on 12/9/16.
//  Copyright © 2016 Richel Cuyler. All rights reserved.
//

import Foundation
import UIKit

class Article {
    var articleImage: UIImage
    var publicationLogo: UIImage
    var articleHeadline: String
    var articleDescription: String
    
    init(articleImage: UIImage, publicationLogo: UIImage, articleHeadline: String, articleDescription: String) {
        self.articleImage = articleImage
        self.publicationLogo = publicationLogo
        self.articleHeadline = articleHeadline
        self.articleDescription = articleDescription
    }
}

