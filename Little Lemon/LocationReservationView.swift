//
//  LocationReservationView.swift
//  Little Lemon
//
//  Created by Nick Pavlov on 4/1/23.
//

import SwiftUI

struct LocationReservationView: View {
    @EnvironmentObject var locations: Locations
    @Environment(\.dismiss) var dismiss
    let location: Location
    
    @State private var numberOfPeople = 0
    @State private var date = Date()
    @State private var name = ""
    @State private var phone = ""
    @State private var email = ""
    @State private var specialRequest = ""
    @State private var alert = false
    @State private var alertTitle = ""
    @State private var alertMessage = ""
    
    var inputFields: Bool {
        numberOfPeople < 1 || name.isEmpty || phone.isEmpty || email.isEmpty ? true: false
    }
    
    var body: some View {
        VStack {
            List {
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
                Stepper("How many people: \(numberOfPeople)", value: $numberOfPeople)
                
                HStack {
                    Text("Date:")
                    DatePicker("", selection: $date)
                }
                
                HStack {
                    Text("Name:")
                    TextField("Enter your name...", text: $name)
                }
                HStack {
                    Text("Phone:")
                    TextField("Your phone number...", text: $phone)
                        .textContentType(.telephoneNumber)
                        .keyboardType(.numberPad)
                }
                HStack {
                    Text("E-Mail:")
                    TextField("Your e-mail...", text: $email)
                        .textContentType(.emailAddress)
                }
                    TextField("add any special request (optional)", text: $specialRequest)
            }
            .listStyle(.plain)
            .padding()
            
            Button {
                if locations.reservations.isEmpty {
                    addReservation()
                    alertTitle = "Success"
                    alertMessage = "Your resrvation has been successfully added!"
                    alert = true
                    dismiss()
                } else {
                    alertTitle = "Error"
                    alertMessage = "You already have a reservation!"
                    alert = true
                    dismiss()
                }
            } label: {
                Text("CONFIRM RESERVATION")
                    .foregroundColor(.white)
                    .padding()
                    .background(inputFields ? .gray: .blue)
                    .clipShape(Capsule())
            }
            .disabled(inputFields ? true: false)
            .padding(.bottom)
            .alert(alertTitle, isPresented: $alert) {
            } message: {
                Text(alertMessage)
            }
        }
    }
    
    func addReservation() {
        let newReservation = Reservation(city: location.city, place: location.place, phone: location.phone, people: numberOfPeople, date: date, name: name, reservatorPhone: phone, email: email, specialRequest: specialRequest)
        locations.reservations.append(newReservation)
       
    }
}

struct LocationReservationView_Previews: PreviewProvider {
    static var previews: some View {
        LocationReservationView(location: .example)
            .environmentObject(Locations())
    }
}
