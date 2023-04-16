//
//  NetworkService.swift
//  MVC_TO_MVVM_UnitTesting
//
//  Created by Ganesh on 16/04/23.
//

import Foundation

struct APIConstant {
    static let APIURL = "https://newsdata.io/api/1/news?apikey=pub_20588ddfa15e4e1db1e23efb1d65c08ef38ba&language=en"
}

enum NetworkError: Error {
    case invalidUrl
    case noDataFound
    case decodingError
}

class NetworkService {
    
    static let shared = NetworkService()
    
    private init() {}
    
    func getArticles(completion: @escaping (Result<[Article]?, NetworkError>) -> Void) {
        
        guard let url = URL(string: APIConstant.APIURL) else {
            completion(.failure(.invalidUrl))
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            
            if error != nil {
                completion(.failure(.noDataFound))
            } else if let data = data {
                do {
                    let articleList = try JSONDecoder().decode(ArticleList.self, from: data)
                    completion(.success(articleList.results))
                } catch  {
                    print(error.localizedDescription)
                    completion(.failure(.decodingError))
                }
            }
        }.resume()
        
    }
}
