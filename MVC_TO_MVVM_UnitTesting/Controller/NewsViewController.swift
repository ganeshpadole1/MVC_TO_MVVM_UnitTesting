//
//  NewsViewController.swift
//  MVC_TO_MVVM_UnitTesting
//
//  Created by Ganesh on 16/04/23.
//

import UIKit

class NewsViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    let persons = ["Ganesh", "Vijay", "Sameer"]
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
        return persons.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        cell?.textLabel?.text = persons[indexPath.row]
        
        return cell!
    }
}
