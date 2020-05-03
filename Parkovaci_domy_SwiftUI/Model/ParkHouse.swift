//
//  ParkHouse.swift
//  Parkovaci_domy_SwiftUI
//
//  Created by Jan Menšík on 01/04/2020.
//  Copyright © 2020 Jan Menšík. All rights reserved.
//


import Foundation

public struct ParkHouse: Hashable {

    
    public var name : String
    public var occupied : Int
    public var maxOccupation : Int
    public var imageUrl : String
    public var paidParkingScheduleDays : [String]
    public var paidParkingScheduleTimes : [String]
    public var parkingPricingInfo : [String]
    public var parkingPricingRates : [String]
    public var latitude : Float
    public var longitude : Float
    public var travelTime : Double? = nil //TODO getter from current location
    
    
}
