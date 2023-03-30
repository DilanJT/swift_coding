//
//  CalorieViewModel.swift
//  CaloriesList
//
//  Created by Dilan Jayamanne on 2023-03-29.
//

import Foundation
import CoreData

class CalorieViewModel: ObservableObject {
    let calorie: Calorie
    
    init(calorie: Calorie) {
        self.calorie = calorie
        self.calories = Double(calorie.calories)
    }
    
    var name: String {
        calorie.name ?? ""
    }
    
    @Published var calories: Double {
        didSet {
            calorie.calories = Int16(calories)
            PersistenceController.shared.save()
        }
    }
    
    func delete() {
        let context = PersistenceController.shared.container.viewContext
        context.delete(calorie)
        PersistenceController.shared.save()
    }
}
