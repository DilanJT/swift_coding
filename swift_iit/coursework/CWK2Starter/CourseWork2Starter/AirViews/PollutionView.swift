//
//  PollutionView.swift
//  Coursework2
//
//  Created by GirishALukka on 30/12/2022.
//

import SwiftUI

struct PollutionView: View {
    
    // @EnvironmentObject and @State varaibles here
    //@EnvironmentObject var PollutionData: AirPollutionModelData
    @EnvironmentObject var modelData: ModelData
    @State var locationString: String = "Location loading..."
    
    
    var body: some View {
        
        ZStack {
            
            // Use ZStack for background images
            Image("background")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 7)
            
            VStack {
                Text("\(locationString)")
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 50, trailing: 10))
                    .font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                    .multilineTextAlignment(.center)
                    
                ScrollView {
                    VStack(spacing: 30){
                        Text("\((Int)(modelData.forecast!.current.temp))ºC")
                            .padding()
                            .font(.largeTitle)
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
                        Text("Feels Like: \((Int)(modelData.forecast!.current.feelsLike))ºC")
                            .padding()
                            .foregroundColor(modelData.forecast!.current.feelsLike < 15 ? Color(red: 30.0/255, green: 41.0/255, blue: 193.0/255) : Color(red: 186.0/255, green: 75.0/255, blue: 15.0/255))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(modelData.forecast!.current.feelsLike < 15 ? Color.blue.opacity(0.1) : Color.orange.opacity(0.1))
                            )
                        
                        Text("Air Quality Data:").bold().font(.title2)
                        
                        
                        HStack{
                            VStack{
                                Image("so2")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))

                                Text("\(String(format: "%.2f",modelData.airPollution?.list[0].components.so2 ?? 0.0))")
                            }
                            VStack{
                                Image("no")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                Text("\((String)(format: "%.2f",modelData.airPollution?.list[0].components.no2 ?? 0.0))")
                            }
                            VStack{
                                Image("voc")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                Text("\((String)(format: "%.2f",modelData.airPollution?.list[0].components.co ?? 0.0))")
                            }
                            VStack{
                                Image("pm")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                Text("\((String)(format: "%.2f",modelData.airPollution?.list[0].components.pm10 ?? 0.0))")
                            }
                        }
                    }
                }
                
            }
        }.onAppear{
            Task.init {
                let _ = try await modelData.loadAirPollutionData()
                self.locationString = await getLocFromLatLong(lat: modelData.forecast!.lat, lon: modelData.forecast!.lon)
            }
        }
    }
}

    
struct Pollution_Previews: PreviewProvider {
    static var previews: some View {
        PollutionView().environmentObject(ModelData())
    }
}

