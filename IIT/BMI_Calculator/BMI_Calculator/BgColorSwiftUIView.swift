//
//  BgColorSwiftUIView.swift
//  BMI_Calculator
//
//  Created by user223941 on 2/10/23.
//

import SwiftUI

struct BgColorSwiftUIView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 200, height: 200)
                .foregroundColor(Color.red)
        }
    }
}

struct BgColorSwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        BgColorSwiftUIView()
    }
}
