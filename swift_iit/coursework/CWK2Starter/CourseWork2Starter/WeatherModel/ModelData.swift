import Foundation

class ModelData: ObservableObject {
    
    @Published var forecast: Forecast?
    @Published  var userLocation: String = ""
    @Published var airPollution : AirPollutionModelData?
    
    
    init() {
        self.forecast = load("london.json")
    }
    
    // function to load weather data from API
    func loadData(lat: Double, lon: Double) async throws -> Forecast {
        
        let url = URL(string: "https://api.openweathermap.org/data/3.0/onecall?lat=\(lat)&lon=\(lon)&units=metric&appid=85b4fd8ba41c782d11db5c52f15fcbf1")
        
        let session = URLSession(configuration: .default)
        
        let (data, _) = try await session.data(from: url!)
        
        do {
            //print(data)
            let forecastData = try JSONDecoder().decode(Forecast.self, from: data)
            DispatchQueue.main.async {
                self.forecast = forecastData
            }
            
            return forecastData
        } catch {
            throw error
        }
    }
    // function to load air pollution data from API
    func loadAirPollutionData() async throws {
        
        guard let lat = forecast?.lat, let lon = forecast?.lon else {
            fatalError("Couldn't find in lat & lon in forcast data.")
        }
                
        let url = URL(string: "https://api.openweathermap.org/data/2.5/air_pollution?lat=\(lat)&lon=\(lon)&appid=85b4fd8ba41c782d11db5c52f15fcbf1"
)
        let session = URLSession(configuration: .default)
        
        let (data,_) = try await session.data(from:url!)
        
        do{
            let pollutionData = try JSONDecoder().decode(AirPollutionModelData.self, from: data)
            DispatchQueue.main.async {
                self.airPollution = pollutionData
                print("testing",self.airPollution?.list[0].components)
            }
        } catch {
            throw error
        }
    }
    
    
    func load<Forecast: Decodable>(_ filename: String) -> Forecast {
        
        let data: Data
        
        guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode(Forecast.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(Forecast.self):\n\(error)")
        }
    }
}
