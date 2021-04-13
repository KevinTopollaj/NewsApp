//
//  NewsListViewModel.swift
//  NewsApp
//
//  Created by Kevin Topollaj on 13.4.21.
//

import Foundation

class NewsListViewModel {
  // MARK: - Properties -
  var newsViewModels = [NewsViewModel]()
  let reuseID = "news"
  
  // MARK: - Helper Methods -
  func getNews(completion: @escaping (Result<[NewsViewModel],APIError>) -> Void) {
    NetworkManager.shared.getNews { result in
      switch result {
      case .success(let news):
        let newsViewModels = news.map(NewsViewModel.init)
        DispatchQueue.main.async {
          self.newsViewModels = newsViewModels
          completion(.success(newsViewModels))
        }
      case .failure(let error):
        completion(.failure(error))
      }
    }
  }
}
