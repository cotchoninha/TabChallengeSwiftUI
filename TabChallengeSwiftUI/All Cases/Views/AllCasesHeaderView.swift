//
//  AllCasesHeaderView.swift
//  TabChallengeSwiftUI
//
//  Created by Spare on 23/06/2020.
//  Copyright © 2020 Marcela Auslenter. All rights reserved.
//

import SwiftUI

struct AllCasesHeaderView: View {
    var body: some View {
        HStack(spacing: 42.0) {
            Image("TABLogo")
                .cornerRadius(8.0)
                .aspectRatio(contentMode: .fill)
                .frame(width: 32, height: 32, alignment: .center)
            Text("TAB's Projects")
                .font(.largeTitle)
                .foregroundColor(Color(red: 1.0, green: 0.264, blue: 0.0))
                .padding([.trailing, .leading], 16)
        }
    }
}

struct AllCasesHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        AllCasesHeaderView()
    }
}
