//
//  AddCalorieView.swift
//  CaloriesList
//
//  Created by Dilan Jayamanne on 2023-03-29.
//

import SwiftUI

struct AddCalorieView: View {
    
    @Environment(\.managedObjectContext) var managedobjContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var calories = 0
    
    var body: some View {
        VStack {
            TextField("Name", text: $name)
            Stepper("Calories: \(calories)", value: $calories)
            Button("Add Calorie") {
                // functionality to add calories
                // this should be moved to the controller
                let context = managedobjContext
                let calorie = Calorie(context: context)
                calorie.name = name
                calorie.calories = Int16(calories)
                PersistenceController.shared.save()
                name = ""
                calories = 0
                
                dismiss()
            }
        }
        .padding()
    }
}

struct AddCalorieView_Previews: PreviewProvider {
    static var previews: some View {
        AddCalorieView()
    }
}
