//
//  ArticleTableViewCell.swift
//  MVC_TO_MVVM_UnitTesting
//
//  Created by Ganesh on 16/04/23.
//

import UIKit

class NewsTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setup(_ article: Article) {
        titleLabel.text = article.title
        descriptionLabel.text = article.description ?? "No Description available"
    }
}
