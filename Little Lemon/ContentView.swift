//
//  ContentView.swift
//  Little Lemon
//
//  Created by Nick Pavlov on 4/1/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var locations = Locations()
    
    var body: some View {
        TabView {
            LocationView()
                .tabItem {
                    Label("Locations", systemImage: "fork.knife")
                }
            
            ReservationView()
                .tabItem {
                    Label("Reservations", systemImage: "note.text.badge.plus")
                }
        }
        .environmentObject(locations)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
