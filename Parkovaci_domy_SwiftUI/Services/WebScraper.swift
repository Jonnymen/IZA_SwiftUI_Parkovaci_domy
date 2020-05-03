//
//  WebScraper.swift
//  Parkovaci_domy_SwiftUI
//
//  Created by Jan Menšík on 01/04/2020.
//  Copyright © 2020 Jan Menšík. All rights reserved.
//



import Foundation
import SwiftSoup

class WebScraper {
    
    public init() {}
    
    private static let parkHouseUrl : String = "https://www.parkovanivbrne.cz/parkovani-dalsi"
    
    public static func getParkHouses() -> [ParkHouse] {
        
        var houseArray : [ParkHouse] = []
        var htmlData : String
        var htmlDoc : Document
        
        if let url = URL(string: parkHouseUrl) {
            do {
                htmlData = try String(contentsOf: url)
            } catch {
                print("Could not download the data!")
                return []
            }
        } else {
                print("URL was not accepted!")
                return []
        }
        
        
        
        do {
            htmlDoc = try SwiftSoup.parse(htmlData)
            let houses : Elements = try htmlDoc.select(".accordion__block")
            for house in houses {
                
                let HouseStruct : ParkHouse? = convertToStruct(from: house)
                if let _house = HouseStruct {
                    houseArray.append(_house)
                }
            }
            print(houseArray)
            return houseArray
            
            
        } catch Exception.Error( _, let msg) {
            print(msg)
        } catch {
            print("Other fatal error!")
        }
        
        
        return []
    }
    
    private static func convertToStruct(from house : Element) -> ParkHouse? {
        
        do {
            //MARK: - Header part
            let header = try house.select(".accordion__header")
            var name = try header.text()
            
            let pstatus = try header.select(".pstatus")
            var occupationMax = try pstatus.text()
            //MARK: Name
            name = name.replacingOccurrences(of: occupationMax, with: "")
            //MARK: Occupied
            let occupied = try pstatus.select(".pstatus__available").text() != "" ? try pstatus.select(".pstatus__available").text() : "0"
            //MARK: OccupationMax
            occupationMax = String(occupationMax.split(separator: "/", maxSplits: 1, omittingEmptySubsequences: true)[1]).replacingOccurrences(of: " ", with: "")
            
            
            //MARK: - Content part
            
            let content = try house.select(".accordion__content")
            
            let paragraphs = try content.select("p")
            //MARK: ImageUrl
            guard let imageUrl = try paragraphs.first()?.select(".image-link").attr("href") else {
                print("Photo not found!")
                return nil
            }
            
            guard let coordinates = try paragraphs.last()?.select("a").text() else {
                print("Coordinates not found!")
                return nil
            }
            //MARK: Latitude
            let latitude = String(coordinates.split(separator: ",", maxSplits: 1, omittingEmptySubsequences: true)[0]).replacingOccurrences(of: "N", with: "")
            //MARK: Longitude
            let longitude = String(coordinates.split(separator: ",", maxSplits: 1, omittingEmptySubsequences: true)[1]).replacingOccurrences(of: "E", with: "").replacingOccurrences(of: " ", with: "")
            
            let prices = try content.select(".prices")
            
            let TimeTable = try prices.select(".prices__block--narrow").select("tr")
            //MARK: PaidParkingSchedule
            var paidParkingScheduleDays : [String] = []
            var paidParkingScheduleTimes : [String] = []
            
            for record in TimeTable {
                if let day = try record.select("td").first()?.text() {
                    paidParkingScheduleDays.append(day)
                }
                if let time = try record.select("td").last()?.text() {
                    paidParkingScheduleTimes.append(time)
                }
            }
            
            let parkPricing = try prices.select(".prices__block--wide").select("tr")
            
            //MARK: ParkingPricing
            var parkingPricingInfo : [String] = []
            var parkingPricingRates : [String] = []
            
            for record in parkPricing {
                if let time = try record.select("td").first()?.text() {
                    parkingPricingInfo.append(time)
                }
                if let price = try record.select("td").last()?.text() {
                    parkingPricingRates.append(price)
                }
            }
            
            /// Model creation
            
            let model = ParkHouse(name: name, occupied: Int(occupied)!, maxOccupation: Int(occupationMax)!, imageUrl: imageUrl, paidParkingScheduleDays: paidParkingScheduleDays, paidParkingScheduleTimes: paidParkingScheduleTimes, parkingPricingInfo: parkingPricingInfo, parkingPricingRates: parkingPricingRates, latitude: Float(latitude)!, longitude: Float(longitude)!)
            
            return model
            
        } catch Exception.Error( _, let msg) {
            
            print(msg)
            return nil
            
        } catch {
            
            print("Error in decoding house")
            return nil
            
        }
    }
    
}
