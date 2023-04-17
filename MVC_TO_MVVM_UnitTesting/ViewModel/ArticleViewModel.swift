//
//  ArticleViewModel.swift
//  MVC_TO_MVVM_UnitTesting
//
//  Created by Ganesh on 17/04/23.
//

import Foundation

struct ArticleListViewModel {
    let articles: [Article]
    
    var numberOfSections: Int {
        return 1
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.articles.count
    }
    
    func articleAtIndex(_ index: Int) -> ArticleViewModel {
        let article = self.articles[index]
        return ArticleViewModel(article: article)
    }
    
}

struct ArticleViewModel {
    let title: String
    let description: String
    let isHighlighted: Bool
    
    init(article: Article) {
        title = article.title
        description = article.description ?? "No Description available"
        isHighlighted = article.title.starts(with: "K")
    }
}

