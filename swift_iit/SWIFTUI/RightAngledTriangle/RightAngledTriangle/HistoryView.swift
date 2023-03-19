//
//  HistoryView.swift
//  RightAngledTriangle
//
//  Created by Dilan Jayamanne on 2023-03-19.
//

import SwiftUI

struct HistoryView: View {
    
    @AppStorage("Base") private var baseAppStorage = ""
    @AppStorage("Altitude") private var altitudeAppStorage = ""
    @AppStorage("Hypotenuse") private var hypotenuseAppStorage = ""
    
    @AppStorage("Area") private var AppStorageAreaValue = ""
    @AppStorage("Perimeter") private var AppStoragePremiterValue = ""
    
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 15) {
                HStack {
                    Text("Base")
                    Spacer()
                    Text(baseAppStorage)
                }
                
                HStack {
                    Text("Altitude")
                    Spacer()
                    Text(altitudeAppStorage)
                }
                
                HStack {
                    Text("Hypotenuse")
                    Spacer()
                    Text(hypotenuseAppStorage)
                }
                
                HStack {
                    Text("Area")
                    Spacer()
                    Text(AppStorageAreaValue)
                }
                
                HStack {
                    Text("Perimeter")
                    Spacer()
                    Text(AppStoragePremiterValue)
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Last Calculation")
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
