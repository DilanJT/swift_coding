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
//        ZStack {
//            HStack {
//
//                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(current.dt)))).formatted(.dateTime.hour().weekday()))
//
//                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(current.weather[0].icon)@2x.png"))
//                    .frame(width: 70, height: 70)
//
//                Text("\((Int)(current.temp))°C")
//
//                Text("\(current.weather[0].weatherDescription.rawValue)")
//
//            }
//        }
        
        ZStack {
            HStack( spacing: 8) {
                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(current.dt)))).formatted(.dateTime.hour().weekday()))
                    .font(.headline)
                    .frame(alignment: .leading)
                Spacer()
                
                AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(current.weather[0].icon)@2x.png"))
                    .frame(width: 70, height: 70)
                
                Text("\(current.weather[0].weatherDescription.rawValue)")
                    .font(.subheadline)
                    .frame(alignment: .leading)
                
                Spacer()
                // color changes to orange if the temperature > 15
                Text("\((Int)(current.temp))°C")
                    .foregroundColor(current.temp < 15 ? Color(red: 30.0/255, green: 41.0/255, blue: 193.0/255) : Color(red: 186.0/255, green: 75.0/255, blue: 15.0/255))
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .foregroundColor(current.temp < 15 ? Color.blue.opacity(0.1) : Color.orange.opacity(0.1))
                    )
                    .font(.subheadline)
                    .frame(alignment: .trailing)
            }
            .padding()
            .foregroundColor(.black)
            .frame(maxWidth: .infinity, alignment: .leading)
            .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white).opacity(0.7))
            .shadow(color: .white, radius: 0.5)
        }

    }
}

struct HourCondition_Previews: PreviewProvider {
    static var hourly = ModelData().forecast!.hourly
    
    static var previews: some View {
        HourCondition(current: hourly[0])
    }
}
