//
//  NetworkManager.swift
//  NewsCards
//
//  Created by Personal on 24/10/21.
//

import Foundation
import Alamofire

class NetworkManager {
    // MARK: - Properties
    private static var sharedNetworkManager: NetworkManager = {
        let networkManager = NetworkManager()
        print("creating network manager")
        return networkManager
    }()

    // Initialization
    private init() {
    }

    // MARK: - Accessors
    class func shared() -> NetworkManager {
        return sharedNetworkManager
    }
    
    // MARK:- Methods
    
    func getDailyHighlights( completion: @escaping ([Article]) -> Void) {
        let request = AF.request("https://newsapi.org/v2/top-headlines?apiKey=\(Constants.newsApiKey)&sources=bbc-news")
        request.responseDecodable(of: BaseAPIResponse.self) { (response) in
            guard let apiResponse = response.value else { return }
            completion(apiResponse.articles)
        }
    }
    
}
