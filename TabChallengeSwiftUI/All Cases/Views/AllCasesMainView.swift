//
//  ContentView.swift
//  TabChallengeSwiftUI
//
//  Created by Spare on 19/06/2020.
//  Copyright © 2020 Marcela Auslenter. All rights reserved.
//

import SwiftUI

struct AllCasesMainView: View {
    var body: some View {
        VStack(spacing: 0) {
            AllCasesHeaderView()
                .padding([.leading, .trailing], 16)
            SplitLineView()
                .padding([.top, .bottom], 16)
            AllCasesListView()
        
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        AllCasesMainView()
    }
}
