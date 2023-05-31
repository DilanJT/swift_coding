//
//  SearchView.swift
//  CWK2_23_GL
//
//  Created by GirishALukka on 11/03/2023.
//

import SwiftUI
import CoreLocation

struct SearchView: View {
    @EnvironmentObject var modelData: ModelData
    
    @Binding var isSearchOpen: Bool
    @State var location = ""
    @Binding var userLocation: String
    
    var body: some View {

        ZStack {
            
            
//            Blur(style: .systemUltraThinMaterial)
//                            .ignoresSafeArea()
//            RoundedRectangle(cornerRadius: 20)
//                                    .fill(Color.teal)
//                                    .opacity(0.8)
//                                    .ignoresSafeArea()
            
            // color changes to orange if the temperature > 15
            
            if(modelData.forecast!.current.feelsLike < 15){
                Color.blue.opacity(0.3)
                    .background(.ultraThinMaterial.opacity(0.7))
                    .ignoresSafeArea()
            }else{
                Color.orange.opacity(0.3)
                    .background(.ultraThinMaterial.opacity(0.7))
                    .ignoresSafeArea()
            }
            
            VStack{
                
                HStack {
                    TextField("Enter New Location", text: self.$location, onCommit: {
                         
                        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in

                            
                            if let lat = placemarks?.first?.location?.coordinate.latitude,
                               let lon = placemarks?.first?.location?.coordinate.longitude {

                                Task{
                                    let _ = try await modelData.loadData(lat: lat, lon: lon)
                                    userLocation = location
                                }
                                
                                isSearchOpen.toggle()
                            }
                            
                            
                        }
                    }
                              
                    )
                    .padding(10)
                    .shadow(color: .blue, radius: 10)
                    .cornerRadius(10)
                    .fixedSize()
                    .font(.custom("Ariel", size: 26))
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .cornerRadius(15)
                    
                    
                    Button(action: {
                        CLGeocoder().geocodeAddressString(location) { (placemarks, error) in
                            if let lat = placemarks?.first?.location?.coordinate.latitude,
                               let lon = placemarks?.first?.location?.coordinate.longitude {
                                Task{
                                    let _ = try await modelData.loadData(lat: lat, lon: lon)
                                    userLocation = location
                                }
                                isSearchOpen.toggle()
                            }
                        }
                    }) {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .font(.system(size: 26))
                            .padding()
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(modelData.forecast!.current.temp < 15 ? Color.blue.opacity(0.7) : Color.orange.opacity(0.7))
                                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                            )
                    }
                }
                
                
                Button(action: {
                                self.isSearchOpen.toggle()
                            }, label: {
                                Text("Cancel")
                                    .font(.title2)
                            })
                            .padding()
                            .foregroundColor(.white)
                            .background(
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(modelData.forecast!.current.temp < 15 ? Color.blue.opacity(0.7) : Color.orange.opacity(0.7))
                                    .shadow(color: Color.black.opacity(0.3), radius: 10, x: 0, y: 5)
                            )
                
            }
            
            
        }
        
        
    }
    
}

// Custom blur effect
struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style = .systemUltraThinMaterial

    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: style))
        return view
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {}
}
