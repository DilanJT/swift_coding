//
//  CalorieView.swift
//  CaloriesList
//
//  Created by Dilan Jayamanne on 2023-03-29.
//

import SwiftUI

struct CalorieView: View {
    @Environment(\.managedObjectContext) var managedobjContext
    
    var calorie: FetchedResults<Calorie>.Element
    
    var doubleBinding: Binding<Double> {
            Binding<Double>(
                get: { Double(calorie.calories) },
                set: { calorie.calories = Int16($0) }
            )
        }
        
        var body: some View {
            HStack {
                Text("\(calorie.calories)")
                Slider(value: doubleBinding, in: 0...1000, step: 1)
                Text("\(calorie.calories) cal")
                Button(action: {
                    managedobjContext.delete(calorie)
                }) {
                    Image(systemName: "trash")
                }
            }
        }
}

//struct CalorieView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalorieView(calorie: FetchedResults<Calorie>.Element)
//    }
//}
