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
    
    @ObservedObject var allCasesCellContent = AllCasesViewModelBuilder()
    
    @State var isAnimating: Bool = true
    
    var body: some View {
        List(allCasesCellContent.allCasesViewModel, id: \.id) { caseStudy in
            VStack {
                Text(caseStudy.clientName)
                AsyncImageView(
                    url: caseStudy.clientImage,
                    placeholder: LoadingSpinnerView(isAnimating: self.$isAnimating, style: .large)
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
