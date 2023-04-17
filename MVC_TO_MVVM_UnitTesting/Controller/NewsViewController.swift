//
//  NewsViewController.swift
//  MVC_TO_MVVM_UnitTesting
//
//  Created by Ganesh on 16/04/23.
//

import UIKit

class GetArticleAdapter {
    static func getArticles(completion: (@escaping (Result<[Article]?, NetworkError>) -> Void)) {
        NetworkService.shared.getArticles { result in
            DispatchQueue.main.async {
                completion(result)
            }
        }
    }
}

typealias GetArticles = (@escaping (Result<[Article]?, NetworkError>) -> Void) -> Void

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // As tests are running in background so
    
    var getArticles: GetArticles = GetArticleAdapter.getArticles
    
    private var articles = [ArticleViewModel]() {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        self.configureTableView()
        self.fetchArticles()
    }
    
    func configureTableView() {
        tableView.dataSource = self
    }
    
    private func fetchArticles() {
        getArticles { result in
            switch result {
            case .success(let articles):
                if let articles = articles {
                    self.articles = articles.map(ArticleViewModel.init)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell", for: indexPath) as! NewsTableViewCell
        let vm = articles[indexPath.row]
        
        cell.setup(vm)
        
        if vm.isHighlighted {
            cell.backgroundColor = .magenta
        } else {
            cell.backgroundColor = .white
        }
        return cell
    }
}
