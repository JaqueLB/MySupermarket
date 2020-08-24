//
//  Service.swift
//  SuperM
//
//  Created by Jaque on 24/08/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class Service {
    enum NetworkError: Error {
        case badUrl
        case malformedJson
        case emptyData
    }

    // generic
    func fetch<T: Decodable>(url: String, type: T.Type, completion: @escaping (Result<T, NetworkError>) -> Void) {
        // Result is an Apple generic, which has a success and an error
        guard let url = URL(string: url) else {
            completion(.failure(.badUrl))
            return
        }

        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data, error == nil else {
                completion(.failure(.emptyData))
                return
            }

            do {
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            } catch {
                completion(.failure(.malformedJson))
            }
        }.resume()
    }

    func fetch(url: String, completion: @escaping (Result<UIImage, Error>) -> Void) {
        guard let url = URL(string: url) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                completion(.failure(error))
            }
            guard let data = data else { return }
            guard let image = UIImage(data: data) else { return }
            completion(.success(image))
        }.resume()
    }
}
