//
//  FirstDetailView.swift
//  NavigationTestProject
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import SwiftUI

struct FirstDetailView: View {
    let items: [String] = ["😀", "😇", "😗", "👻"]
    var body: some View {
        List(items, id: \.self) {item in
            NavigationLink(
                destination: EmojiView(item: item), label: {
                    Text (item)
                })
            .navigationTitle("First detail view")
        }
    }
}

struct FirstDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            FirstDetailView()
        }
    }
}
