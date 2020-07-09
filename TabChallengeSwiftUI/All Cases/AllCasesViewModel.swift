//
//  AllCasesViewModel.swift
//  TabChallengeSwiftUI
//
//  Created by Spare on 29/06/2020.
//  Copyright © 2020 Marcela Auslenter. All rights reserved.
//

import Combine
import Foundation
import SwiftUI

class AllCasesViewModelBuilder: ObservableObject {
    
    @Published var allCasesViewModel = [AllCasesViewModelStructure]()
    @Published var error: ErrorType?
    @State var isAnimating: Bool = true
    
    private let networkOperations = NetworkOperations()

    private var publisherRequest: Cancellable? {
        didSet { oldValue?.cancel() }
    }
    
    deinit {
        publisherRequest?.cancel()
    }
    
    func getCaseStudies() {
        isAnimating = true
        publisherRequest = networkOperations.requestCaseStudies()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { [weak self] value in
                switch value {
                case .finished:
                    break
                case .failure(let error):
                    self?.error = ErrorType.error(description: error.localizedDescription)
                }
                }, receiveValue: { projects in
                    projects.caseStudies.forEach { caseStudy in
                        self.allCasesViewModel.append(AllCasesViewModelStructure(clientName: caseStudy.client ?? "", clientImage: caseStudy.heroImage, teaser: caseStudy.teaser
                        ))
                    }
                    self.isAnimating = false
            })
    }
}

struct AllCasesViewModelStructure: Identifiable {
    
    var id = UUID()
    let clientName: String
    let clientImage: String
    let teaser: String
    
}
