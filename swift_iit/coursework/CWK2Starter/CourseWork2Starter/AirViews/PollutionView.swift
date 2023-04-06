//
//  PollutionView.swift
//  Coursework2
//
//  Created by GirishALukka on 30/12/2022.
//

import SwiftUI

struct PollutionView: View {
    
    // @EnvironmentObject and @State varaibles here
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        
        ZStack {
            
            // Use ZStack for background images
            
            VStack {
                Text("")
                Spacer()
                Text("This is a mixed view with weather \n and air quality data,\n refer to Figure 5 to see what data must be displayed here")
                Spacer()
                
            }
            
            
            .foregroundColor(.black)
            .shadow(color: .black,  radius: 0.5)
            .onAppear {
                Task {
                    try await modelData.loadAirPollutionData()
                }
            }
            
        }.ignoresSafeArea(edges: [.top, .trailing, .leading])
    }
}



struct PollutionView_Previews: PreviewProvider {
    static var previews: some View {
        PollutionView().environmentObject(ModelData())
    }
}
