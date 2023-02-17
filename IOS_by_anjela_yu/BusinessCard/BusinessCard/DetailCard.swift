//
//  DetailCard.swift
//  BusinessCard
//
//  Created by user223941 on 2/18/23.
//

import SwiftUI

struct DetailCard: View {
    var iconName:String
    var detailText:String
    var textSize: CGFloat
    var textStyle: String?
    
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .fill(Color(red: 0.93, green: 0.94, blue: 0.95))
            .frame(width: UIScreen.main.bounds.width * 0.75, height: 50)
            .overlay(
                HStack {
                    Image(systemName: iconName)
                        .foregroundColor(Color.green)
                    Text(detailText)
                        .font(Font.custom(textStyle ?? "Pacifico-Regular", size: textSize))
                        .foregroundColor(Color(
                            red: 0.17, green: 0.24, blue: 0.31
                        ))
                }
            ).padding(.all)
    }
}

struct DetailCard_Previews: PreviewProvider {
    static var previews: some View {
        DetailCard(
            iconName: "mail.fill",
            detailText: "dicman",
            textSize: 20
        )
        .previewLayout(.sizeThatFits)
    }
}
