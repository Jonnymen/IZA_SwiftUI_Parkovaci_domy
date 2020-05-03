//
//  ContentView.swift
//  Parkovaci_domy_SwiftUI
//
//  Created by Jan Menšík on 01/04/2020.
//  Copyright © 2020 Jan Menšík. All rights reserved.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @State public var parkHouseList: [ParkHouse] = WebScraper.getParkHouses()

    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
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
