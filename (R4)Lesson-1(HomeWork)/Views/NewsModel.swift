//
//  NewsModel.swift
//  (R4)Lesson-1(HomeWork)
//
//  Created by Ahmed Muvaza on 18/5/23.
//

import Foundation

// MARK: - NewsData
struct NewsData: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    let source: Source?
    let author, title, description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

// MARK: - Source
struct Source: Codable {
    let id: String
    let name: String
}
