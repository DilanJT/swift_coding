//
//  FirstTabView.swift
//  NavigationTestProject
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import SwiftUI

struct FirstTabView: View {
    var body: some View {
        
        NavigationView {
            VStack {
                Text ("First tab view")
                NavigationLink("Go to detail", destination:
                                FirstDetailView())
            }
        }
    }
}

struct FirstTabView_Previews: PreviewProvider {
    static var previews: some View {
        FirstTabView()
    }
}
