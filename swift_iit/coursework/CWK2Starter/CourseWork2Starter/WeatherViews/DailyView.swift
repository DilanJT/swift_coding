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
            
            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(day.weather[0].icon)@2x.png"))
                .frame(width: 70, height: 70, alignment: .leading)

            Spacer()

            VStack {
                Text("\(day.weather[0].weatherDescription.rawValue)")
                    .font(.subheadline)

                Text(Date(timeIntervalSince1970: TimeInterval(((Int)(day.dt)))).formatted(.dateTime.weekday().day()))
                    .font(.subheadline)
                
            }
            
            Spacer()

            // color changes to orange if the temperature > 15
            Text("\((Int)(day.temp.max))°C/\((Int)(day.temp.min))°C")
                .foregroundColor(day.temp.max < 15 ? Color(red: 30.0/255, green: 41.0/255, blue: 193.0/255) : Color(red: 186.0/255, green: 75.0/255, blue: 15.0/255))
                .background(
                    RoundedRectangle(cornerRadius: 10)
                        .foregroundColor(day.temp.max < 15 ? Color.blue.opacity(0.1) : Color.orange.opacity(0.1))
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

struct DailyView_Previews: PreviewProvider {
    static var day = ModelData().forecast!.daily
    
    static var previews: some View {
        DailyView(day: day[0])
    }
}
