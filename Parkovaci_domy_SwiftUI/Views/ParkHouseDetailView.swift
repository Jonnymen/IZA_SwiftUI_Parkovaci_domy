//
//  ParkHouseDetailView.swift
//  Parkovaci_domy_SwiftUI
//
//  Created by Jan Menšík on 03/04/2020.
//  Copyright © 2020 Jan Menšík. All rights reserved.
//

import SwiftUI

struct ParkHouseDetailView: View {
    
    var parkHouse : ParkHouse
    @ObservedObject var imageDownloader: ImageDownloader
    
    init(parkHouse: ParkHouse) {
        self.parkHouse = parkHouse
        imageDownloader = ImageDownloader(urlString: self.parkHouse.imageUrl)
    }
    
    var imageContent: AnyView {
        if let image = UIImage(data: imageDownloader.data) {
            return AnyView(
                Image(uiImage: image)
                    .resizable()
                    .frame(height: 250)
                    .aspectRatio(contentMode: .fill)
            )
        }
        else {
            return AnyView(
                Text("Image was not loaded")
            )
        }
    }
    
    var body: some View {
        ZStack {
            ScrollView {
                VStack {
                   Text(self.parkHouse.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.blue)
                        .multilineTextAlignment(.center)
                        .lineLimit(3)
        //                .padding(.horizontal)
                        .padding(EdgeInsets(top: -50, leading: 15, bottom: 0, trailing: 15))
                    
                    self.imageContent
                    
                    Text("Zpoplatněno v:")
                        .underline()
                        .fontWeight(.bold)
                        .padding(.top)
                        
                    HStack(spacing: 10.0) {
                        VStack {
                            ForEach(0..<self.parkHouse.paidParkingScheduleDays.count) {num in
                                Text(self.parkHouse.paidParkingScheduleDays[num] + ":")
                            }
                        }
                        VStack {
                            ForEach(0..<self.parkHouse.paidParkingScheduleTimes.count) {num in
                                Text(self.parkHouse.paidParkingScheduleTimes[num])
                            }
                        }
                    }.padding(.top)
                    Text("Ceny za parkování:")
                        .underline()
                        .fontWeight(.bold)
                        .padding(.top)

                    ForEach(0..<self.parkHouse.parkingPricingInfo.count) {num in
                        VStack (spacing: 0) {
                            Text(self.parkHouse.parkingPricingInfo[num] + ":")
                                .fontWeight(.semibold)
                            Text(self.parkHouse.parkingPricingRates[num])
                        }.padding(.top)
                    }
                    
                    
                    Rectangle()
                        .frame(height: 100)
                        .foregroundColor(.white)
                        
                }.frame(width: UIScreen.main.bounds.width)
            }
            GeometryReader { geometry in
                ZStack {
                    Rectangle()
                        .foregroundColor(.white)
                        .border(Color.black, width: 0.5)
                    HStack {
                        HStack(spacing: 0) {
                            Text("Obsazenost: ")
                            Text(String(self.parkHouse.occupied))
                                .foregroundColor(
                                    self.parkHouse.occupied == self.parkHouse.maxOccupation ? .red : .green
                            )
                            Text(" / \(self.parkHouse.maxOccupation)")
                        }.padding(.leading)
                        Spacer()
                        Button(action: self.openMap) {
                            ZStack {
                                Rectangle()
                                    .background(Color.blue)
                                    .cornerRadius(10)
                                Text("Navigovat")
                                    .foregroundColor(.white)
                                    .fontWeight(.bold)
                            }.frame(width: 120, height: 50)
                                .padding(.trailing)
                        }
                    }
                }.frame(width: geometry.size.width, height: 100)
                    .position(x: geometry.size.width / 2, y: geometry.size.height - 50)
            }
        }
    }
    
    func openMap() {
        let mapUrlString = "http://maps.apple.com/?daddr=" + String(self.parkHouse.latitude) + "," + String(self.parkHouse.longitude) + "&dirflg=d&t=m"
        if let url = URL(string: mapUrlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        }
        
    }

}


struct ParkHouseDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ParkHouseDetailView(parkHouse: ParkHouse(name: "Jméno", occupied: 50, maxOccupation: 300, imageUrl: "https://picsum.photos/200", paidParkingScheduleDays: ["PO", "UT", "ST"], paidParkingScheduleTimes: ["9:00 - 18:00", "9:00 - 18:00", "9:00 - 18:00"], parkingPricingInfo: ["První hodina", "Další hodina"], parkingPricingRates: ["40 Kč", "30 Kč"], latitude: 21.0022, longitude: 32.0011))
    }
}
