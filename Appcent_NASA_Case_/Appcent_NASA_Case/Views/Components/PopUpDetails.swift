//
//  PopUpDetails.swift
//  Appcent_NASA_Case
//
//  Created by Zeliha Uslu on 14.04.2022.
//

import SwiftUI

struct PopUpDetails: View{
    let launchDate: String
    let landingDate: String
    let camera: String
    
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                VStack(spacing: 10) {
                    Text("Launch Date")
                        .modifier(PopupDetailsTitleModifier())
                    Text(launchDate)
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity)
                VStack(spacing: 10) {
                    Text("Landing Date")
                        .modifier(PopupDetailsTitleModifier())
                    Text(landingDate)
                        .fontWeight(.light)
                }
                .frame(maxWidth: .infinity)
            }
            VStack {
                Text("Camera")
                    .modifier(PopupDetailsTitleModifier())
                Text(camera)
                    .fontWeight(.light)
            }
        }
        .padding(.horizontal, 20)
    }
}
