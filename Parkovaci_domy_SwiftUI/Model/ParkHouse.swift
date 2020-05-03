//
//  ParkHouse.swift
//  Parkovaci_domy_SwiftUI
//
//  Created by Jan Menšík on 01/04/2020.
//  Copyright © 2020 Jan Menšík. All rights reserved.
//


// This file represents the main model of data - parking house


import Foundation

public struct ParkHouse: Hashable {

    
    public var name : String                        // name of parking house
    public var occupied : Int                       // actual occupation
    public var maxOccupation : Int                  // maximal occupation
    public var imageUrl : String                    // url of house picture
    public var paidParkingScheduleDays : [String]   // array of days for parking fees
    public var paidParkingScheduleTimes : [String]  // array of times for parking fees
    public var parkingPricingInfo : [String]        // array of info about pricing
    public var parkingPricingRates : [String]       // array of pricing rates
    public var latitude : Float                     // latitude coordinate of house
    public var longitude : Float                    // longitude coordinate of house
    public var travelTime : Double? = nil           //TODO travel time in minutes from actual location
    
    
}
