//
//  ContentView.swift
//  Parkovaci_domy_SwiftUI
//
//  Created by Jan Menšík on 01/04/2020.
//  Copyright © 2020 Jan Menšík. All rights reserved.
//


// This file represents the main screen of application

import SwiftUI

struct ContentView: View {
    
    // Variable containing downloaded data about parking houses from WebScraper service
    @State public var parkHouseList: [ParkHouse] = WebScraper.getParkHouses()

    
    var body: some View {
        
        // Navigation hierarchy through the application
        NavigationView {
            ScrollView {
                VStack {
                    
                    // Rendering views for all parking houses with link to detailed view
                    ForEach(parkHouseList, id: \.self) { house in
                        NavigationLink(destination: ParkHouseDetailView(parkHouse: house)){
                            ParkHouseFrameView(parkHouse: house)
                            .scaleEffect(0.95)
                                .foregroundColor(.white)
                        }
                        
                        
                    }
                }
            }
        .navigationBarTitle("Parkovací domy Brno")
        }
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
