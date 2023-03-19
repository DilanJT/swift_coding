//
//  HistoryView.swift
//  RightAngledTriangle2
//
//  Created by Dilan Jayamanne on 2023-03-17.
//

import SwiftUI

struct HistoryView: View {
    
    @AppStorage("Base") private var baseAppStorage = ""
    @AppStorage("Altitude") private var altitudeAppStorage
    
    @AppStorage("Hypotenuse") private var hypotenuseAppStorage
    
    @AppStorage("Area") private var calculatedAreaValue = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
            }
        }
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
