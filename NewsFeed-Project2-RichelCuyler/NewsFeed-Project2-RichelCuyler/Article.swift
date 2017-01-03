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
    var articleHeadline: String
    var articleDescription: String
    var url: String
    var urlToImage: String
    
    init(articleHeadline: String, articleDescription: String, url: String, urlToImage: String) {
        self.articleHeadline = articleHeadline
        self.articleDescription = articleDescription
        self.url = url
        self.urlToImage = urlToImage
    }
}


