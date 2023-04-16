//
//  Article.swift
//  MVC_TO_MVVM_UnitTesting
//
//  Created by Ganesh on 16/04/23.
//

import Foundation

struct Articles {
    let articles: [Article]
}

struct Article: Decodable {
    let author: String
    let title: String
}
