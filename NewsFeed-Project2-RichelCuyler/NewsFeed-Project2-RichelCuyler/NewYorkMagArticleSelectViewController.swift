//
//  NewYorkMagArticleSelectViewController.swift
//  NewsFeed-Project2-RichelCuyler
//
//  Created by Richel Cuyler on 12/31/16.
//  Copyright © 2016 Richel Cuyler. All rights reserved.
//

import UIKit
import SafariServices

class NewYorkMagArticleSelectViewController: UIViewController {

    @IBOutlet weak var articleSelectTableView: UITableView!
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getData(source: .newyorkmag, completion: { (articles: [Article]?) -> () in
            self.articles = articles!
            self.articleSelectTableView.reloadData()
        })
    }
}

extension NewYorkMagArticleSelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let article = articles[indexPath.row]
        let safari = SFSafariViewController(url: URL(string: article.url)!)
        navigationController?.pushViewController(safari, animated: true)
    }
}


extension NewYorkMagArticleSelectViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "articleCell", for: indexPath) as! SelectArticleTableViewCell
        let article = articles[indexPath.row]
        cell.articleHeadline.text = article.articleHeadline
        cell.articleDescription.text = article.articleDescription
        cell.articleImage.downLoadImage(from: article.urlToImage)
        return cell
    }
}

