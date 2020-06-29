//
//  AllCasesListView.swift
//  TabChallengeSwiftUI
//
//  Created by Spare on 23/06/2020.
//  Copyright © 2020 Marcela Auslenter. All rights reserved.
//

import SwiftUI

struct AllCasesViewModel: Identifiable {
    var id = UUID()
    let clientName: String
    let clientImage: String
    let teaser: String
    
}

struct AllCasesListView: View {
    
    var allCasesCellContent: AllCasesViewModel
    @State var isAnimating: Bool = true

    var body: some View {
        List {
            VStack {
                Text(allCasesCellContent.clientName)
                AsyncImageView(
                    url: allCasesCellContent.clientImage,
                    placeholder: LoadingSpinnerView(isAnimating: $isAnimating, style: .large)
                ).aspectRatio(contentMode: .fit)
            }
        }
    }
}

struct AllCasesListView_Previews: PreviewProvider {
    static var previews: some View {
        AllCasesListView(allCasesCellContent: AllCasesViewModel(clientName: "TfL", clientImage: "https://raw.githubusercontent.com/theappbusiness/engineering-challenge/master/endpoints/v1/images/decelerator_header-image-2x.jpg", teaser: "Testing Tube brakes, with TfL Decelerator"))
    }
}
