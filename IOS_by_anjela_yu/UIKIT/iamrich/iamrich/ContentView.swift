//
//  ContentView.swift
//  iamrich
//
//  Created by DIlan on 2023-02-16.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            
            Text("i am rich").font(.title)
            Image("diamond").aspectRatio(contentMode: .fit)

        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
