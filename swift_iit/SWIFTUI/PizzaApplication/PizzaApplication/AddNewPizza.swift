//
//  AddNewPizza.swift
//  PizzaApplication
//
//  Created by Dilan Jayamanne on 2023-03-10.
//

import SwiftUI

struct AddNewPizza: View {
    
    @ObservedObject var viewModel : PizzaViewModel
    
    @State private var pizzaName = ""
    @State private var pizzaIngredients = ""
    @State private var pizzaImgDetails = ""
    @State private var pizzaType = ""
    @State private var isPizzaFav = false
    
    @Environment (\.dismiss) var dismiss
    
    var body: some View {
                
        NavigationStack{
            Form {
                Section {
                    TextField("Name", text: $pizzaName)
                } header: {
                    Text("Pizza Name")
                }
                
                Section {
                    TextEditor(text: $pizzaIngredients)
                        .frame(height: 200)
                } header: {
                    Text("Ingredients")
                }
                
                Section {
                    TextField("Image Name", text: $pizzaImgDetails)
                } header: {
                    Text("Pizza Image Details")
                }

                Section {
                    TextField("Type", text: $pizzaType)
                } header: {
                    Text("Pizza Type")
                }
                
                Section {
                    Toggle("Favourite", isOn: $isPizzaFav)
                }
            }
            .navigationTitle("New Pizza")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement:.navigationBarLeading){
                    Button("Cancel") {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button("Save"){
//                        guard let {
                            viewModel.addPizzaData(name: pizzaName, ingredients: pizzaIngredients, imageName: pizzaImgDetails, pizzaType: pizzaType, isFavourite: isPizzaFav)
//                        }
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddNewPizza_Previews: PreviewProvider {
    static var previews: some View {
        AddNewPizza(viewModel: PizzaViewModel())
    }
}
