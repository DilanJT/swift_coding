//
//  AirPollutionModelData.swift
//  CourseWork2Starter
//
//  Created by Dilan Jayamanne on 2023-03-31.
//

import Foundation

struct AirPollutionModelData: Codable {
    let coord: Coord
    let list: [AirPollutionList]
}

struct Coord: Codable {
    let lon: Double
    let lan: Double
}

struct AirPollutionList: Codable {
    let dt: Int
    let main: AirMain
    let components: AirPollutionDataComponents
}

struct AirMain: Codable {
    let aqi: Int
}

struct AirPollutionDataComponents: Codable {
    let co: Double
    let no: Double
    let o3: Double
    let so2: Double
    let pm2_5: Double
    let pm10: Double
    let nh3: Double
}
