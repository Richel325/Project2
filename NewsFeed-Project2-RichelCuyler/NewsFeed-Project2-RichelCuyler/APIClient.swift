//
//  APIClient.swift
//  NewsFeed-Project2-RichelCuyler
//
//  Created by Richel Cuyler on 12/22/16.
//  Copyright © 2016 Richel Cuyler. All rights reserved.
//

import Foundation

enum Source: String {
    case buzzfeed = "buzzfeed"
    case newyorkmag = "new-york-magazine"
    case verge = "the-verge"
    case techcrunch = "techcrunch"
}


class APIClient{
    
    static func getData(source: Source, completion: @escaping ([Article]?) -> ()) {
        DispatchQueue.global(qos: .background).async{
            
            let endpoint = "https://newsapi.org/v1/articles?source=\(source.rawValue)&sortBy=latest&apiKey=f846aff45c904bedae7187764e6f60a9"
            let url = URLRequest(url: URL(string: endpoint)!)
            let session = URLSession(configuration: URLSessionConfiguration.default)
            let task = session.dataTask(with: url) { data, _, _ in
                let json = try! JSONSerialization.jsonObject(with: data!, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String: Any]
                let abc = self.getArticles(json)
                
                DispatchQueue.main.async {
                    completion(abc)
                }
                
            }
            
            task.resume()
        }
    }
    
    
    static func getArticles(_ json: [String: Any]) -> [Article] {
        
        var articles = [Article]()
        if let listOfArticles = json["articles"] as? [[String: Any]] {
            for jsonArticle in listOfArticles {
                let articleHeadline = jsonArticle["title"] as? String ?? ""
                let articleDescription = jsonArticle["description"] as? String ?? ""
                let urlToArticle = jsonArticle["url"] as? String ?? ""
                let urlToImage = jsonArticle["urlToImage"] as? String ?? ""
                let article = Article(articleHeadline: articleHeadline, articleDescription: articleDescription, url: urlToArticle, urlToImage: urlToImage)
                articles.append(article)
            }
        }
        return articles
    }
}
