//
//  WeatherDTO.swift
//  WeatherApp
//
//  Created by user223941 on 2/17/23.
//

import Foundation

struct WeatherDTO: Decodable {
    let name: String
    let weather: [WeatherSummary]
    let main: MainWeatherData
    let wind: WindData
    let clouds: CloudsData
    
}

struct MainWeatherData: Decodable {
    let temp: Double
    let pressure: Int
    let humidity: Int
    let feelsLike: Double
    
    //
    enum CodingKeys: String, CodingKey {
        case temp = "temp"
        case pressure
        case humidity
        case feelsLike = "feels_like"
    }
}

struct WeatherSummary : Decodable {
    let description : Double
}

struct WindData: Decodable {
    let speed: Double
}

struct CloudsData: Decodable {
    let all: Int
}
