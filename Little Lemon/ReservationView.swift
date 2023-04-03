//
//  ReservationView.swift
//  Little Lemon
//
//  Created by Nick Pavlov on 4/1/23.
//

import SwiftUI

struct ReservationView: View {
    @EnvironmentObject var locations: Locations
    @State private var alert = false
    
    var body: some View {
        VStack {
            LittleLemonLogo()
                .padding()
            VStack {
                if locations.reservations.isEmpty {
                    Text("No reservation yet")
                        .foregroundColor(.secondary)
                        .font(.title3)
                } else {
                    Text("Your reservation")
                        .padding()
                        .background(.thickMaterial)
                        .clipShape(Capsule())
                    List {
                        ForEach(locations.reservations) { reservation in
                            VStack(alignment: .leading, spacing: 10) {
                                Text("RESTAURANT")
                                    .padding(.bottom)
                                    .bold()
                                Text(reservation.city)
                                    .font(.title3.bold())
                                HStack {
                                    Text(reservation.place)
                                    Text("-")
                                    Text(reservation.phone)
                                }
                                //.foregroundColor(.secondary)
                                Text("Name: \(reservation.name)")
                                Text("E-Mail: \(reservation.email)")
                                Text("Phone: \(reservation.phone)")
                                Text("Party: \(reservation.people)")
                                Text("Date: \(reservation.date.formatted(date: .numeric, time: .shortened))")
                                Text("Special request: \(reservation.specialRequest)")
                                    .padding(.bottom)
                            }
                        }
                    }
                    .listStyle(.plain)
                    
                    Button {
                        alert = true
                    } label: {
                        Text("Cancel reservation")
                            .padding()
                            .foregroundColor(.white)
                            .background(.red)
                            .clipShape(Capsule())
                            .padding(.bottom)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        .padding()
        .alert("Are you sure you want to cancel this reservation?", isPresented: $alert) {
            Button("Cancel", role: .cancel) { }
            Button("Yes", role: .destructive) { locations.reservations.removeAll() }
        }
    }
}

struct ReservationView_Previews: PreviewProvider {
    static var previews: some View {
        ReservationView()
            .environmentObject(Locations())
    }
}
