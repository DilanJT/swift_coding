//
//  HomeView.swift
//  CWK2_23_GL
//
//  Created by GirishALukka on 10/03/2023.
//

import SwiftUI
import CoreLocation

struct Home: View {
    
    @EnvironmentObject var modelData: ModelData
    @State var isSearchOpen: Bool = false
    @State  var userLocation: String = ""
    
    
    var body: some View {
        ZStack {
            Image("background2")
                .resizable()
                .ignoresSafeArea()
            VStack (spacing: 20){
                
    //            Text("This is the initial view when the app launches, that must show  weather data as in Figure 1.\nInitial data is loaded from file on launch and a change of location should should update the weather data.\nBuild this view so that it mirrors this image")
    //                .font(.subheadline)
    //                .fontWeight(.semibold)
    //                .multilineTextAlignment(.center)
    //                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
    //            Text("Refer to Figure 1 for weather elements that must be rendered.")
    //                .font(.subheadline)
    //                .fontWeight(.semibold)
    //                .multilineTextAlignment(.center)
    //                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                Button {
                    self.isSearchOpen.toggle()
                } label: {
                    Text("Change Location")
                        .bold()
                        .font(.system(size: 30))
                }
                .sheet(isPresented: $isSearchOpen) {
                    SearchView(isSearchOpen: $isSearchOpen, userLocation: $userLocation)
                }
                .padding()
                
                
                Text(userLocation)
                    .font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                    .multilineTextAlignment(.center)
                
                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(modelData.forecast?.current.dt ?? 0))))
                    .formatted(.dateTime.year().hour().month().day()))
                .padding()
                .font(.largeTitle)
                .foregroundColor(.black)
                .shadow(color: .black, radius: 1)
                
                Spacer()
                
                Text("Temp: \((Int)(modelData.forecast!.current.temp))ºC")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                Text("Humidity: \((Int)(modelData.forecast!.current.humidity))%")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                Text("Pressure: \((Int)(modelData.forecast!.current.pressure))hPa")
                    .padding()
                    .font(.title2)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                
                HStack {
                    AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png" ))
                        .frame(width: 70, height: 70)
                    Text("\(modelData.forecast!.current.weather[0].weatherDescription.rawValue)")
                }
                
                Text("The tab bar navigation must be re-engineered\n to mirror what has been shown in all the images.")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
                
                
                
                Spacer()
            }
            .onAppear {
                Task.init {
                    self.userLocation = await getLocFromLatLong(lat: modelData.forecast!.lat, lon: modelData.forecast!.lon)
                    self.modelData.userLocation = userLocation
                }
                
        }
        }
        
    }
}

struct Home_Preview: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(ModelData())
    }
}
