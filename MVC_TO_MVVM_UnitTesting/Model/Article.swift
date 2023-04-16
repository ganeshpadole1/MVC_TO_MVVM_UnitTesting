//
//  Article.swift
//  MVC_TO_MVVM_UnitTesting
//
//  Created by Ganesh on 16/04/23.
//

import Foundation
//
//struct ArticleList: Decodable {
//    let results: [Article]
//}
//
//struct Article: Decodable {
//    let title: String
//    let description: String
//}


// MARK: - Welcome
struct ArticleList: Decodable {
    let results: [Article]
}

// MARK: - Result
struct Article: Decodable {
    let title: String
    let description: String?
}

