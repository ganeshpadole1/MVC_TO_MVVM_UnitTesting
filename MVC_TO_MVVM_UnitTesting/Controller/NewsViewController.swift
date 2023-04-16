//
//  NewsViewController.swift
//  MVC_TO_MVVM_UnitTesting
//
//  Created by Ganesh on 16/04/23.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var articles = [Article]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
       
        fetchArticles()
    }
    
    private func fetchArticles() {
        NetworkService.shared.getArticles {[weak self] result in
            switch result {
            case .success(let articles):
                DispatchQueue.main.async {
                    if let articles = articles {
                        self?.articles = articles
                    }
                   
                    self?.tableView.reloadData()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

extension NewsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! ArticleTableViewCell
        let article = articles[indexPath.row]
        cell.setup(article)
        
        return cell
    }
}
