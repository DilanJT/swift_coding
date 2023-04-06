//
//  ContentView.swift
//  SwiftUIAPIcalls
//
//  Created by Dilan Jayamanne on 2023-04-06.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        NavigationView {
            List{
                ForEach(viewModel.courses, id: \.self) {course in
                    
                    HStack {
                        URLImage(urlString: course.image)
                        
                        Text("\(course.name)")
                            .bold()
                    }
                    
                }
                
            }.navigationTitle("Courses")
                .onAppear {
                    viewModel.fetch()
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
