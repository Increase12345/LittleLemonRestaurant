//
//  LocationView.swift
//  Little Lemon
//
//  Created by Nick Pavlov on 4/1/23.
//

import SwiftUI

struct LocationView: View {
    @EnvironmentObject var locations: Locations
    
    var body: some View {
        NavigationStack {
            VStack {
                LittleLemonLogo()
                Text("Select a location")
                    .padding()
                    .background(.thickMaterial)
                    .clipShape(Capsule())
                List {
                    ForEach(locations.allLocations) { location in
                        NavigationLink {
                            LocationReservationView(location: location)
                        } label: {
                            VStack(alignment: .leading) {
                                Text(location.city)
                                    .font(.title3)
                                HStack {
                                    Text(location.place)
                                    Text("-")
                                    Text(location.phone)
                                }
                                .foregroundColor(.secondary)
                            }
                        }
                    }
                }
                .listStyle(.plain)
            }
            .padding()
        }
    }
}

struct LocationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationView()
            .environmentObject(Locations())
    }
}
