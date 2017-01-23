//
//  ViewController.swift
//  NewsFeed-Project2-RichelCuyler
//
//  Created by Richel Cuyler on 12/7/16.
//  Copyright © 2016 Richel Cuyler. All rights reserved.
//

import UIKit
import SafariServices

class BuzzfeedArticleSelectViewController: UIViewController {
    
    //@IBOutlet weak var articleSearchBar: UISearchBar!
    @IBOutlet weak var articleSelectTableView: UITableView!
    
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        APIClient.getData(source: .buzzfeed, completion: { (articles: [Article]?) -> () in
            self.articles = articles!
            self.articleSelectTableView.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

extension BuzzfeedArticleSelectViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //let cell = tableView.cellForRow(at: indexPath) as! newsTableViewCell
        let article = articles[indexPath.row]
        let safari = SFSafariViewController(url: URL(string: article.url)!)
        navigationController?.pushViewController(safari, animated: true)
    }
}


extension BuzzfeedArticleSelectViewController: UITableViewDataSource {
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


extension UIImageView {
    func downLoadImage(from url: String) {
        let urlRequest = URLRequest(url: URL(string: url)!)
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            guard let data = data, error == nil else { return }
            DispatchQueue.main.async {
                self.image = UIImage(data: data)
            }
        }
        task.resume()
    }
}
