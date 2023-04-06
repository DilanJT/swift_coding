//
//  DailyView.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct DailyView: View {
    var day : Daily
   
    var body: some View {
        
        HStack {
            AsyncImage(url: URL(string:
                                    "https://openweathermap.org/img/wn/\(day.weather[0].icon)@2x.png"))
            Spacer()
            VStack {
                Text("\(day.weather[0].weatherDescription.rawValue)")
                
                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(day.dt))))
                    .formatted(.dateTime.weekday().day())
                )
                
            }
            Spacer()
            Text("\(String(format: "%.2f",day.temp.min))ºC / \(String(format: "%.2f", day.temp.max))ºC")
           
        }.padding()
    }
    
}

struct DailyView_Previews: PreviewProvider {
    static var day = ModelData().forecast!.daily
    
    static var previews: some View {
        DailyView(day: day[0])
    }
}
