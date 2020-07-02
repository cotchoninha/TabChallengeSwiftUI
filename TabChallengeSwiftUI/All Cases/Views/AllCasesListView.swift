//
//  AllCasesListView.swift
//  TabChallengeSwiftUI
//
//  Created by Spare on 23/06/2020.
//  Copyright © 2020 Marcela Auslenter. All rights reserved.
//

import SwiftUI
import Alamofire

struct AllCasesListView: View {
    
    private let networkOperations = NetworkOperations()
    
    @State var allCasesCellContent: [AllCasesViewModel] = []
    @State var isAnimating: Bool = true
    
    var body: some View {
        List(allCasesCellContent, id: \.id) { caseStudy in
            VStack {
                Text(caseStudy.clientName)
                AsyncImageView(
                    url: caseStudy.clientImage,
                    placeholder: LoadingSpinnerView(isAnimating: self.$isAnimating, style: .large)
                ).aspectRatio(contentMode: .fit)
            }
        }.onAppear {
            self.networkOperations.requestCaseStudies()
        }
    }
}

struct AllCasesListView_Previews: PreviewProvider {
    static var previews: some View {
        AllCasesListView(allCasesCellContent: [AllCasesViewModel(clientName: "TfL", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_header-image-2x.jpg", teaser: "Testing Tube brakes, with TfL Decelerator")])
    }
}
