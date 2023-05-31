//
//  NavBar.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct NavBar: View {
    
    @EnvironmentObject var modelData: ModelData
    
    // Tab view accent color changes to orange if the temp is > 50 otherwise its blue
    
    var body: some View {
        TabView{
           Home()
                .tabItem{
                    
                    Label("City", systemImage: "magnifyingglass")
                }
            CurrentWeatherView()
                .tabItem {
                    
                    Label("WeatherNow", systemImage: "sun.max")
                }
            
            HourlyView()
                .tabItem{
                    
                    Label("HourlyView", systemImage: "clock.fill")
                }
            ForecastView()
                .tabItem {
                    
                    Label("ForecastView", systemImage: "calendar")
                }
            PollutionView()
                .tabItem {
                    
                    Label("PollutionView", systemImage: "aqi.high")
                }
        }.onAppear {
            UITabBar.appearance().isTranslucent = false
        }
        .accentColor(modelData.forecast!.current.temp < 15 ? Color(.blue) : Color(.orange))
        
    }
        
}

struct NavBar_Previews: PreviewProvider {
    static var previews: some View {
        NavBar().environmentObject(ModelData())
    }
}
