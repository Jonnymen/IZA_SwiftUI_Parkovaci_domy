//
//  ParkHouseFrameView.swift
//  Parkovaci_domy_SwiftUI
//
//  Created by Jan Menšík on 01/04/2020.
//  Copyright © 2020 Jan Menšík. All rights reserved.
//

import SwiftUI

struct ParkHouseFrameView: View {
    
    var parkHouse : ParkHouse
    
    var body: some View {
        ZStack {
            Rectangle()
                .colorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                .cornerRadius(20)
            VStack {
                Text(parkHouse.name)
                    .font(.title)
                    .foregroundColor(Color.blue)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .padding([.top, .leading, .trailing])
                Spacer()
                HStack {
                    HStack (spacing: 0) {
                        Text("Obsazenost: ")
                        Text("\(self.parkHouse.occupied)")
                            .foregroundColor(
                                self.parkHouse.occupied == self.parkHouse.maxOccupation ? .red : .green
                        )
                        Text(" / \(self.parkHouse.maxOccupation)")
                    }.foregroundColor(.black)
                    Spacer()
                    HStack{
                        Image(systemName: "car")
                        Text("x min")
                    }.foregroundColor(.black)
                        .padding(.trailing)
                }
                .padding([.leading, .bottom])
            }
        }.frame(height: 150)
        .shadow(radius: 20)
    }
}

struct ParkHouseFrameView_Previews: PreviewProvider {
    static var previews: some View {
        ParkHouseFrameView(parkHouse: ParkHouse(name: "Jméno", occupied: 50, maxOccupation: 300, imageUrl: "https://picsum.photos/200", paidParkingScheduleDays: ["PO", "UT", "ST"], paidParkingScheduleTimes: ["9:00 - 18:00", "9:00 - 18:00", "9:00 - 18:00"], parkingPricingInfo: ["První hodina", "Další hodina"], parkingPricingRates: ["40 Kč", "30 Kč"], latitude: 21.0022, longitude: 32.0011))
    }
}
