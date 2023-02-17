//
//  NetworkStore.swift
//  WeatherApp
//
//  Created by user223941 on 2/17/23.
//

import Foundation

struct NetworkStore: ObservableObject {
    
    var weatherData: WeatherDataModel?
    private var baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(APIConstants.KEY)&units=metric"
    
    func fetchData(cityName: String) async{
        var urlString = "\(baseURL)&q=\(cityName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "" // ?? is the optional and "" is the defualt value
        
        // URL
        guard let url = URL(string: urlString) else {
            print("Invalid Url")
            return
        }
        
        //URLSession
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodableData = try JSONDecoder().decode(WeatherDTO.self, from: data)
            weatherData = WeatherDataModel(name: decodableData.name,
                                           description: decodableData.weather[0].description.capitalized,
                                           temp: decodableData.main.temp,
                                           pressure: decodableData.main.pressure,
                                           humidity: decodableData.main.humidity,
                                           feedlsLike: decodableData.visibility,
                                           visibility: decodableData.weatherData?.visibility,
                                           windSpeed: decodableData.WindData.speed
                                           
            )
        }catch {
            print("Error")
        }
        
       
        
        //Decode
    }
    
}
