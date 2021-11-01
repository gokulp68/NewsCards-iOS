//
//  BaseAPIResponse.swift
//  NewsCards
//
//  Created by Personal on 24/10/21.
//

import Foundation

struct BaseAPIResponse: Codable {
    let status: String
    let totalResults: Int
    let articles: [Article]
}
