//
//  Article.swift
//  NewsCards
//
//  Created by Personal on 24/10/21.
//

import Foundation

struct Article: Codable {
    let author: String
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String
}
