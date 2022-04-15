//
//  PopUpTitle.swift
//  Appcent_NASA_Case
//
//  Created by Zeliha Uslu on 14.04.2022.
//

import SwiftUI

struct PopUpTitle: View {
    
    let title: String
    let date: String
    
    var body: some View{
        VStack(alignment: .leading, spacing: 10) {
            Text("\(title)")
                .font(.title)
                .fontWeight(.bold)
            Text("\(date)")
                .font(.callout)
                .fontWeight(.light)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal, 20)
        .padding(.bottom, 40)
    }
}
