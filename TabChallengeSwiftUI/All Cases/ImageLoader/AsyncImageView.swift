//
//  AsyncImageView.swift
//  TabChallengeSwiftUI
//
//  Created by Spare on 23/06/2020.
//  Copyright © 2020 Marcela Auslenter. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

struct AsyncImageView<Placeholder: View>: View {
    
    @ObservedObject private var loader: ImageLoader
    private let placeholder: Placeholder?
    
    private var image: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!)
                    .resizable()
            } else {
                placeholder
            }
        }
    }
    
    init(url: String, placeholder: Placeholder? = nil) {
        
        loader = ImageLoader(url: url)
        self.placeholder = placeholder
    }

    var body: some View {
        img
            .onAppear(perform: loader.load)
            .onDisappear(perform: loader.cancel)
    }
    
    private var img: some View {
        placeholder
    }
}
