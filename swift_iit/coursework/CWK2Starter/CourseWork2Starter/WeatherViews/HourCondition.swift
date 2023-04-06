//
//  HourCondition.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct HourCondition: View {
    var current : Current
    
    
    var body: some View {
        HStack {
            VStack {
                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(current.dt))))
                    .formatted(.dateTime.hour())
                )
                Text(Date(timeIntervalSince1970:
                            TimeInterval(((Int)(current.dt))))
                    .formatted(.dateTime.weekday()))
                
                
            }
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(current.weather[0].icon)@2x.png"))
            
            HStack {
                Text("\(String(format: "%.2f",current.temp))ºC")
                Text("\(current.weather[0].weatherDescription.rawValue)")
            }
            
            
        }.padding()
    }
}

struct HourCondition_Previews: PreviewProvider {
    static var hourly = ModelData().forecast!.hourly
    
    static var previews: some View {
        HourCondition(current: hourly[0])
    }
}
