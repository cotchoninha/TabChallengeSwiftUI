//
//  LoadingSpinnerView.swift
//  TabChallengeSwiftUI
//
//  Created by Spare on 24/06/2020.
//  Copyright © 2020 Marcela Auslenter. All rights reserved.
//

import SwiftUI
import UIKit

struct LoadingSpinnerView: UIViewRepresentable {
    
    typealias UIViewType = UIActivityIndicatorView
    
    @Binding var isAnimating: Bool
    let style: UIActivityIndicatorView.Style

    func makeUIView(context: UIViewRepresentableContext<LoadingSpinnerView>) -> UIActivityIndicatorView {
        return UIActivityIndicatorView(style: style)
    }

    func updateUIView(_ uiView: UIActivityIndicatorView, context: UIViewRepresentableContext<LoadingSpinnerView>) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
    }
}

//struct LoadingSpinnerView_Previews: PreviewProvider {
//    @State var isAnimating: Bool = true
//    static var previews: some View {
//        
//        LoadingSpinnerView(isAnimating: $isAnimating, style: .medium)
//    }
//}
