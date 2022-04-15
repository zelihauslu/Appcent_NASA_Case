//
//  PopUpView.swift
//  Appcent_NASA_Case
//
//  Created by Zeliha Uslu on 14.04.2022.
//

import SwiftUI

struct PopupView: View {
    
    @Binding var photo: PhotoModel
    
    var body: some View {
        VStack(spacing: 30) {
            AsyncImage(url: URL(string: "https" + photo.img_src.dropFirst(4))!, content: { image in
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }) {
                Image("Rover")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            PopUpTitle(title: photo.rover.name, date: photo.earth_date)
            PopUpDetails(launchDate: photo.rover.launch_date, landingDate: photo.rover.landing_date, camera: photo.camera.name)
            Spacer()
        }
    }
}
