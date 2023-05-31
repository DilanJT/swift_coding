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
                .blur(radius: 7)
            VStack {
                
                Button {
                    self.isSearchOpen.toggle()
                } label: {
                    HStack (spacing: 8){
                            Image(systemName: "location.fill")
                            .font(.system(size: 24))
//                                .foregroundColor(.white)
                            Text("Change Location")
                                .bold()
                                .font(.system(size: 30))
//                                .foregroundColor(.white)
                        }
                    .padding(.vertical, 12)
                        .padding(.horizontal, 16)
                        .foregroundColor(.white)
                        .background(
                            RoundedRectangle(cornerRadius: 20)
                                .fill(modelData.forecast!.current.temp < 15 ? Color.blue.opacity(0.7) : Color.orange.opacity(0.7))
                                .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                        )
                }
                .sheet(isPresented: $isSearchOpen) {
                    SearchView(isSearchOpen: $isSearchOpen, userLocation: $userLocation)
                        .background(BackgroundClearView())
                }.padding()
                    
                    
                
                ScrollView {
                    VStack{
                        
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
                        .padding(EdgeInsets(top: 10, leading: 10, bottom: 20, trailing: 10))
                        
                        Spacer()
                        
                        Text("Temp: \((Int)(modelData.forecast!.current.temp))ºC")
                            .padding()
                            .font(.title2)
                            .shadow(color: .black, radius: 0.5)
                            .foregroundColor(modelData.forecast!.current.feelsLike < 15 ? Color(red: 30.0/255, green: 41.0/255, blue: 193.0/255) : Color(red: 186.0/255, green: 75.0/255, blue: 15.0/255))
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .foregroundColor(modelData.forecast!.current.feelsLike < 15 ? Color.blue.opacity(0.1) : Color.orange.opacity(0.1))
                            )
                        
                        Text("Humitidy: \((Int)(modelData.forecast!.current.humidity))%")
                            .padding()
                            .font(.title2)
                            .foregroundColor(.black)
                            .shadow(color: .black, radius: 0.5)
                        
                        Text("Pressure: \((Int)(modelData.forecast!.current.pressure)) hpa")
                            .padding()
                            .font(.title2)
                            .foregroundColor(.black)
                            .shadow(color: .black, radius: 0.5)
                        
                        HStack{
                            AsyncImage(url: URL(string: "https://openweathermap.org/img/wn/\(modelData.forecast!.current.weather[0].icon)@2x.png"))
                                .frame(width: 70, height: 70)
                            Text("\(modelData.forecast!.current.weather[0].weatherDescription.rawValue)")
                                .padding()
                                .font(.title2)
                                .foregroundColor(.black)
                                .shadow(color: .black, radius: 0.5)
                        }
                        
                        Spacer()
                    }
                }
                
                
                
                
                
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

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home().environmentObject(ModelData())
    }
}

struct BackgroundClearView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIView()
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {}
}
