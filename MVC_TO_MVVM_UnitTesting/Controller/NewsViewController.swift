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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = "News"
        navigationController?.navigationBar.prefersLargeTitles = true
        tableView.reloadData()
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
