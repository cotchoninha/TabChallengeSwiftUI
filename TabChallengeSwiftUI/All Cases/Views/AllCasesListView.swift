//
//  AllCasesListView.swift
//  TabChallengeSwiftUI
//
//  Created by Spare on 23/06/2020.
//  Copyright © 2020 Marcela Auslenter. All rights reserved.
//

import SwiftUI

struct AllCasesListView: View {
    
    @ObservedObject var allCasesCellContent = AllCasesViewModelBuilder()
    
    var body: some View {
        List(allCasesCellContent.allCasesViewModel, id: \.id) { caseStudy in
            VStack(alignment: .leading) {
                Text(caseStudy.clientName)
                AsyncImageView(
                    url: caseStudy.clientImage,
                    placeholder: LoadingSpinnerView(isAnimating: self.allCasesCellContent.$isAnimating, style: .medium)
                ).aspectRatio(contentMode: .fit)
            }
        }.onAppear {
            self.allCasesCellContent.getCaseStudies()
        }
    }
}

struct AllCasesListView_Previews: PreviewProvider {
    static var previews: some View {
        AllCasesListView()
    }
}
