//
//  Forecast.swift
//  Coursework2
//
//  Created by G Lukka.
//

import SwiftUI

struct ForecastView: View {
    @EnvironmentObject var modelData: ModelData
    @State var locationString: String = "Location loading..."
    
    var body: some View {
        
        ZStack {
            Image("background2")
                .resizable()
                .ignoresSafeArea()
                .blur(radius: 7)
            
            VStack{
                Text("\(locationString)").font(.title)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 0.5)
                    .padding(EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 10))
                List{
                    ForEach(modelData.forecast!.daily) { day in
                        DailyView(day: day)
                    }
                    .listRowBackground(modelData.forecast!.current.temp < 15 ? Color(.blue).opacity(0.2) : Color(.orange).opacity(0.2))
                    
                }
                .scrollContentBackground(.hidden)
            }
        }
        .onAppear{
            Task.init {
                self.locationString = await getLocFromLatLong(lat: modelData.forecast!.lat, lon: modelData.forecast!.lon)
            }
        }
    }
}

struct Forecast_Previews: PreviewProvider {
    static var previews: some View {
        ForecastView().environmentObject(ModelData())
    }
}
