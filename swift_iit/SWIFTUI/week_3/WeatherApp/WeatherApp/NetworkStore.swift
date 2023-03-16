//
//  NetworkStore.swift
//  WeatherApp
//
//  Created by user223941 on 2/17/23.
//

import Foundation

class NetworkStore: ObservableObject {
    
    @Published var weatherData: WeatherDataModel?
    private var baseURL = "https://api.openweathermap.org/data/2.5/weather?appid=\(APIConstants.KEY)&units=metric"
    
    func fetchData(cityName: String) async{
        let urlString = "\(baseURL)&q=\(cityName)".addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "" // ?? is the optional and "" is default value
        
        // URL
        guard let url = URL(string: urlString) else {
            print("Invalid Url")
            return
        }
        
        //URLSession
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodableData = try JSONDecoder().decode(WeatherDTO.self, from: data)
            
            DispatchQueue.main.sync {
                self.weatherData = WeatherDataModel(
                    name: decodableData.name,
                    description: decodableData.weather[0].description.capitalized,
                    temp: decodableData.main.temp,
                    pressure: decodableData.main.pressure,
                    humidity: decodableData.main.humidity,
                    feelsLike: decodableData.main.feelsLike,
                    visibility: decodableData.visibility,
                    windSpeed: decodableData.wind.speed,
                    cloudPercentage: decodableData.clouds.all
                                               
                )
            }
            
            
        }catch {
            print("Error")
        }
        
       
        
        //Decode
    }
    
}
