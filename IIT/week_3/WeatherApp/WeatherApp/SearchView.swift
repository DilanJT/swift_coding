//
//  SearchView.swift
//  WeatherApp
//
//  Created by user223941 on 2/17/23.
//

import SwiftUI

struct SearchView: View {
    @State var cityName: String = ""
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text("Weather").font(.largeTitle).bold()
                HStack {
                    TextField("City name", text: $cityName)
                    
                    Button{
                        print("Button pressed")
                    }label: {
                        Text("Search")
                        
                    }
                }
                
                
                HStack(){
                    WeatherCardView(
                        image: "aqi.low",
                        title: "Broken Clouds",
                        subTitle: "Cloudiness"
                    )
                    WeatherCardView(
                        image: "thermometer.low",
                        title: "26.5",
                        subTitle: "Temperature"
                    )
                }
                HStack{
                    WeatherCardView(
                        image: "humidity",
                        title: "64.0",
                        subTitle: "Humidity"
                    )
                    WeatherCardView(
                        image: "tornado",
                        title: "26.5",
                        subTitle: "Temperature"
                    )
                }
                HStack{
                    WeatherCardView(
                        image: "sun.dust.fill",
                        title: "10000.0",
                        subTitle: "Visibility"
                    )
                    WeatherCardView(
                        image: "wind",
                        title: "26.5",
                        subTitle: "Wind Speed"
                    )
                }
                
                HStack{
                    WeatherCardView(
                        image: "cloud.fill",
                        title: "68.0",
                        subTitle: "Clouds(%)"
                    )
                    
                    Spacer()
                    
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
