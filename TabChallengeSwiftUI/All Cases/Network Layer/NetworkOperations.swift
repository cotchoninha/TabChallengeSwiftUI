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

final class NetworkOperations {
        
    @Published var caseStudies: [CaseStudy] = []
    @Published var error: AFError?
    
    private let caseStudiesUrl = "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/caseStudies.json"
    
//    init() {}
    
    func requestCaseStudies() {
        AF.request(caseStudiesUrl).responseData { response in
            switch response.result {
            case .success(let data):
                do {
                    let decodedResponse = try JSONDecoder().decode(Projects.self, from: data)
                    
                    DispatchQueue.main.async {
                        self.caseStudies = decodedResponse.caseStudies
                        
                    }
                } catch {
                    print(error)
                     self.error = error.asAFError
                }
            case .failure(let error):
                self.error = error.asAFError
            }
        }
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
