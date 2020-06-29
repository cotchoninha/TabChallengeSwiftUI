//
//  ImageLoader.swift
//  TabChallengeSwiftUI
//
//  Created by Spare on 23/06/2020.
//  Copyright © 2020 Marcela Auslenter. All rights reserved.
//

import SwiftUI
import Combine
import Foundation

class ImageLoader: ObservableObject {
    
    @Published var image: UIImage?
    private var cancellable: AnyCancellable?
    private let url: String

    init(url: String) {
        self.url = url
    }
    
    deinit {
        cancellable?.cancel()
    }
    
    func load() {
        guard let url = URL(string: url) else { return }
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
        .map { UIImage(data: $0.data) }
        .replaceError(with: nil)
        .receive(on: DispatchQueue.main)
        .assign(to: \.image, on: self)
    }

    func cancel() {
        cancellable?.cancel()
    }
}
