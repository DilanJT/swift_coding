//
//  EmojiView.swift
//  NavigationTestProject
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import SwiftUI

struct EmojiView: View {
    
    let item:String
    
    var body: some View {
        Text (item)
        .font(.system(size: 120))
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background (Color.pink)
        
        Button {
            
        }label: {
            Text("Go back to root")
        }
        
        Button {
            presentationMode.wrappedValue.dismiss()
        }label: {
            Text("Go one step back")
        }
    }
}

struct EmojiView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiView(item: "😁")
    }
}
