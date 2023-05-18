//
//  ApiManager.swift
//  (R4)Lesson-1(HomeWork)
//
//  Created by Ahmed Muvaza on 18/5/23.
//

import Foundation

class ApiManager {
    static let shared = ApiManager()
    
    func getRequest(completion: @escaping (Result<NewsData, Error>) -> Void) {
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8a10cb9a44ed497196ccf0833200a4e9") else {return}
        
        
        let request = URLRequest(url: url)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let response = response {
                print(response)
            }
            
            guard let data = data else {return}
            
            do {
                let model = try JSONDecoder().decode(NewsData.self, from: data)
                completion(.success(model))
            } catch {
                completion(.failure(error))
            }
        }
        task.resume()
    }
}
