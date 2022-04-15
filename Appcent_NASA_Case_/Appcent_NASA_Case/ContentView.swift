//
//  ContentView.swift
//  Appcent_NASA_Case
//
//  Created by Zeliha Uslu on 14.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var selection: Int = 1
    
    init() {
        UITabBar.appearance().backgroundColor = .white
    }
    
    var body: some View {
        VStack {
            TabView(selection: $selection) {
                NavigationView {
                    RoverView(roverName: .spirit)
                }
                    .tag(1)
                    .tabItem {
                        Label {
                            Text("Spirit")
                        } icon: {
                            Image(systemName: "moon.fill")
                        }
                    }
                NavigationView{
                    RoverView(roverName: .curiosity)
                }
                    .tag(2)
                    .tabItem {
                        Label {
                            Text("Curiosity")
                        } icon: {
                            Image(systemName: "moon.circle")
                        }
                    }
                NavigationView{
                    RoverView(roverName: .opportunity)
                }
                    .tag(3)
                    .tabItem {
                        VStack {
                            Image(systemName: "circle.grid.cross")
                            Text("Opportunity")
                        }
                    }
            }
            .accentColor(.orange)
            .frame(maxWidth: .infinity)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



