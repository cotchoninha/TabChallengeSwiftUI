//
//  NetworkOperations.swift
//  TabChallengeSwiftUI
//
//  Created by Spare on 29/06/2020.
//  Copyright © 2020 Marcela Auslenter. All rights reserved.
//

import Foundation
import Combine
import Alamofire

enum ErrorType: Error {
    case error(description: String)
}

final class NetworkOperations {
    
    private let caseStudiesUrl = "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/caseStudies.json"
        
    func requestCaseStudies() -> AnyPublisher<Projects, ErrorType> {
        
        guard let url = URL(string: caseStudiesUrl) else {
            return Fail(error: ErrorType.error(description: "Invalid URL"))
                .eraseToAnyPublisher()
        }

        let urlRequest = URLRequest(url: url)
        
        return URLSession.shared.dataTaskPublisher(for: urlRequest)
            .tryMap { response -> Data in
                guard
                  let httpURLResponse = response.response as? HTTPURLResponse,
                  httpURLResponse.statusCode == 200
                  else {
                    throw ErrorType.error(description: "statusCode")
                }
                return response.data
        }
        .decode(type: Projects.self, decoder: JSONDecoder())
        .mapError({ ErrorType.error(description: $0.localizedDescription)
        })
        .eraseToAnyPublisher()
    }
    
//    func loadImage(url: String, completion: @escaping imageDataResponse) {
//
//        guard let url = URL(string: url) else {
//            print("Invalid URL")
//            return
//        }
//
//        let request = URLRequest(url: url)
//
//        session.dataTask(with: request) { data, _, error in
//
//            if let error = error {
//                completion(nil, error)
//                return
//            }
//
//            guard let data = data else {
//                print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
//                return
//            }
//            DispatchQueue.main.async {
//                completion(data, nil)
//            }
//
//        }.resume()
//    }
}
