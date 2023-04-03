//
//  Reservation.swift
//  Little Lemon
//
//  Created by Nick Pavlov on 4/1/23.
//

import Foundation

class Locations: ObservableObject {
    @Published var allLocations: [Location] = addReservation()
    @Published var reservations: [Reservation] = []
    
    let savedPaths = FileManager.documentsDirectory.appendingPathComponent("SavedReservation")
    
    init() {
        do {
            let data = try Data(contentsOf: savedPaths)
            reservations = try JSONDecoder().decode([Reservation].self, from: data)
        } catch {
            reservations = []
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(reservations)
            try data.write(to: savedPaths)
        } catch {
            print("Can't save data")
        }
    }
    
    static func addReservation() -> [Location] {
        [
        Location(city: "Las Vegas", place: "Downtown", phone: "702-555-9898"),
        Location(city: "New York", place: "North Hollywood", phone: "213-555-1453"),
        Location(city: "Los Angeles", place: "Venice", phone: "310-555-1222"),
        Location(city: "Miami", place: "Downtown", phone: "725-555-5454"),
        Location(city: "San Francisco", place: "North Beach", phone: "415-555-1345"),
        Location(city: "Denver", place: "Aurora", phone: "720-397-9353")
        ]
    }
    
    
}

struct Location: Identifiable {
    var id = UUID()
    var city: String
    var place: String
    var phone: String
    
    static let example = Location(city: "Las Vegas", place: "Downtown", phone: "720-384-4754")
}

struct Reservation: Identifiable, Codable {
    var id = UUID()
    var city: String
    var place: String
    var phone: String
    var people: Int
    var date: Date
    var name: String
    var reservatorPhone: String
    var email: String
    var specialRequest: String
}
