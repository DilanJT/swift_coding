//
//  Conditions.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct CurrentWeatherView: View {
    
    @EnvironmentObject var modelData: ModelData
    
    @State var locationString: String = "Location loading..."
    
    
    
    var body: some View {
        ZStack {
            // Background Image rendering code here
            Image("background2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 7)
            

                VStack (){
                    
                    Text("\(locationString)")
                        .font(.title)
                        .foregroundColor(.black)
                        .shadow(color: .black, radius: 0.5)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    
                    
                    
                    ScrollView {
                        VStack (spacing: 30){
                            
                            Text("\((Int)(modelData.forecast!.current.temp))ºC")
                                .padding()
                                .font(.system(size: 60))
                                .foregroundColor(modelData.forecast!.current.feelsLike < 15 ? Color(red: 30.0/255, green: 41.0/255, blue: 193.0/255) : Color(red: 186.0/255, green: 75.0/255, blue: 15.0/255))
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(modelData.forecast!.current.feelsLike < 15 ? Color.blue.opacity(0.1) : Color.orange.opacity(0.1))
                                )
                                
                            
                            HStack{
                                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                                    .frame(width: 70, height: 70)
                                Text("\(modelData.forecast!.current.weather[0].weatherDescription.rawValue)")
                                    .padding()
                                    .font(.title2)
                                    .foregroundColor(.black)
                                    .shadow(color: .black, radius: 0.5)
                            }
                            
                            // color changes to orange if the temperature > 15
                            Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC").padding()
                                .foregroundColor(modelData.forecast!.current.feelsLike < 15 ? Color(red: 30.0/255, green: 41.0/255, blue: 193.0/255) : Color(red: 186.0/255, green: 75.0/255, blue: 15.0/255))
                                .font(Font.custom("Helvetica", size: 24))
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .foregroundColor(modelData.forecast!.current.feelsLike < 15 ? Color.blue.opacity(0.1) : Color.orange.opacity(0.1))
                                )
                            
                            HStack {
                                
                                Text("Wind Speed: \(String(format: "%.0f", modelData.forecast!.current.windSpeed)) m/s")
                                Text("Direction: \(convertDegToCardinal(deg:modelData.forecast!.current.windDeg))")
                                
                            }
                            
                            
                            
                            HStack {
                                
                                Text("Humidity: \(modelData.forecast!.current.humidity) %")
                                Spacer()
                                Text("Pressure: \(modelData.forecast!.current.pressure) hPg")
                            }.padding()
                            
                            
                            HStack {
                                
                                Label {
                                    Text("\(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.sunrise ?? 0)))).formatted(.dateTime.hour().minute()))")
                                } icon: {
                                    Image(systemName: "sun.and.horizon.fill").foregroundColor(.yellow)
                                }
                                
                                Label {
                                    Text("\(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.sunset ?? 0)))).formatted(.dateTime.hour().minute()))")
                                } icon: {
                                    Image(systemName: "sun.and.horizon.fill").foregroundColor(.yellow)
                                }
                                
                            }.padding()
                
                        }.padding().font(.title2)
                    }
                    
                    
                }
                .foregroundColor(.black)
            .shadow(color: .black,  radius: 0.5)
            
            
        }.onAppear {
            Task.init {
                self.locationString = await getLocFromLatLong(lat: modelData.forecast!.lat, lon: modelData.forecast!.lon)
                
            }
            
    }

    }
}

struct Conditions_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
            .environmentObject(ModelData())
    }
}
