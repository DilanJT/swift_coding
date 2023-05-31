//
//  AirPollutionModelData.swift
//  CourseWork2Starter
//
//  Created by Dilan Jayamanne on 02/04/23.
//

import Foundation

// MARK: - AirPollutionModelData
struct AirPollutionModelData: Codable {
    let coord: Coord
    let list: [AirPollutionDataList]
}

// MARK: - Coord
struct Coord:Codable{
    let lon : Double
    let lat : Double
    
}


// MARK: - AirPollutionDataList
struct AirPollutionDataList:Codable {
    let dt: Int
    let main: AirPollutionDataMain
    let components: AirPollutionDataComponents
}


// MARK: - AirPollutionDataMain
struct AirPollutionDataMain:Codable {
    let aqi:Int
}

// MARK: - AirPollutionDataComponents
struct AirPollutionDataComponents:Codable {
    let co:Double
    let no:Double
    let no2:Double
    let o3:Double
    let so2:Double
    let pm2_5:Double
    let pm10:Double
    let nh3:Double
}
