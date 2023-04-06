//
//  Conditions.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct CurrentWeatherView: View {
    @EnvironmentObject var modelData: ModelData
    
    @State var locationString: String = "No location"
    
    var body: some View {
        ZStack {
            // Background Image rendering code here
            Image("background2")
                .resizable()
                .ignoresSafeArea()
            VStack {
                
                Text("\(modelData.userLocation)")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)

                VStack{

        //          Temperature Info
                    VStack (spacing: 20){
                        Text("\((Int)(modelData.forecast!.current.temp))ºC")
                            .padding()
                            .font(.largeTitle)
                        HStack {
                            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png" ))
                                .frame(width: 70, height: 70)
                            
                            Text(modelData.forecast!.current.weather[0].weatherDescription.rawValue.capitalized)
                                .foregroundColor(.black)
                        }
                        
                        HStack {
                            Text("")
                            Text("")
                        }

                        Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC")
                            .foregroundColor(.black)
                        
                        HStack {
                            Text("Wind Speed:\(String(format: "%.2f", modelData.forecast!.current.windSpeed))")
                            
                            Text("Direction: \(convertDegToCardinal(deg:modelData.forecast!.current.windDeg))")
                        }
                        
                        HStack {
                            Text("Humidity: \(modelData.forecast!.current.humidity)")
                            Text("Presure: \(modelData.forecast!.current.pressure)")
                        }
                        
                        HStack {
                            Label{
                                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast!.current.sunset ?? 0))))
                                    .formatted(.dateTime.hour().minute())
                                )
                                
                            }icon: {
                                Image(systemName: "sun.and.horizon.fill")
                                    .foregroundColor(.yellow)
                            }
                            
                            Label{
                                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast!.current.sunrise ?? 0))))
                                    .formatted(.dateTime.hour().minute())
                                )
                                
                            }icon: {
                                Image(systemName: "sun.and.horizon.fill")
                                    .foregroundColor(.yellow)
                            }
                        }
                    }.padding()
                    
 

                }
                
            }
            .foregroundColor(.black)
            .shadow(color: .black,  radius: 0.5)
            
        }.ignoresSafeArea(edges: [.top, .trailing, .leading])
    }
}

struct Conditions_Previews: PreviewProvider {
    static var previews: some View {
        CurrentWeatherView()
            .environmentObject(ModelData())
    }
}
