//
//  PopupDetailsTitleModifier.swift
//  Appcent_NASA_Case
//
//  Created by Zeliha Uslu on 15.04.2022.
//

import SwiftUI

struct PopupDetailsTitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 16, weight: .bold))
            .textCase(.uppercase)
    }
}
