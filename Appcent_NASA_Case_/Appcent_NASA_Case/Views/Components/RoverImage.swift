//
//  RoverImage.swift
//  Appcent_NASA_Case
//
//  Created by Zeliha Uslu on 14.04.2022.
//

import SwiftUI

struct RoverImage: View {
    
    let image: URL
    
    var body: some View {
        AsyncImage(url: image) { image in
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 14, x: 0, y: 0)
        } placeholder: {
            Image("Rover")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 14, x: 0, y: 0)
        }

    }
}
