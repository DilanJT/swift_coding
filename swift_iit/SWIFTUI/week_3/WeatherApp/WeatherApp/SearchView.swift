//
//  SearchView.swift
//  WeatherApp
//
//  Created by user223941 on 2/17/23.
//

import SwiftUI

struct SearchView: View {
    @StateObject var networkStore = NetworkStore()
    @State var cityName: String = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Weather").font(.largeTitle).bold()
                HStack {
                    TextField("City name", text: $cityName)
                    
                    Button{
                        guard !cityName.isEmpty else {return}
                        print("dev test fetching data")
                        Task {
                            await networkStore.fetchData(cityName: cityName)
                        }
                        print("Button pressed")
                    }label: {
                        Text("Search")
                        
                    }
                }
                
                
                if let data = networkStore.weatherData {

                    HStack(){
                        WeatherCardView(
                            image: "aqi.low",
                            title: "\(data.description)",
                            subTitle: "Cloudiness"
                        )
                        WeatherCardView(
                            image: "thermometer.low",
                            title: "\(data.formattedTemp)",
                            subTitle: "Temperature"
                        )
                    }
                    HStack{
                        WeatherCardView(
                            image: "humidity",
                            title: "\(data.humidity)",
                            subTitle: "Humidity"
                        )
                        WeatherCardView(
                            image: "tornado",
                            title: "\(data.pressure)",
                            subTitle: "Temperature"
                        )
                    }
                    HStack{
                        WeatherCardView(
                            image: "sun.dust.fill",
                            title: "\(data.visibility)",
                            subTitle: "Visibility"
                        )
                        WeatherCardView(
                            image: "wind",
                            title: "\(data.windSpeed)",
                            subTitle: "Wind Speed"
                        )
                    }
                    
                    HStack{
                        WeatherCardView(
                            image: "cloud.fill",
                            title: "\(data.cloudPercentage)",
                            subTitle: "Clouds(%)"
                        )
                        
                        Spacer()
                        
                    }
                }
                
                
            }.padding([.leading, .trailing], 30)
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}

struct WeatherCardView: View {
    
    var image:String
    var title:String
    var subTitle:String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: UIScreen.main.bounds.width * 0.45, height: 200)
                .foregroundColor(.gray)
                .opacity(0.4)
            
            VStack(spacing: 10) {
                
                Image(systemName: image)
                    .font(.system(size: 50))
                
                Text(title)
                    .font(.system(size: 20).bold())
                
                Text(subTitle)
                
            }
        }
    }
}
