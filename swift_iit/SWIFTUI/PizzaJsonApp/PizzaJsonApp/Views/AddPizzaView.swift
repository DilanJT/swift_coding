//
//  AddPizzaView.swift
//  PizzaJsonApp
//
//  Created by Dilan Jayamanne on 2023-03-30.
//

import SwiftUI

struct AddPizzaView: View {
    
    @Environment(\.presentationMode) private var presentationMode
    @EnvironmentObject var pizzaStore: PizzaStore
    @Binding var pizza: Pizza
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Name")) {
                    TextField("Pizza Name", text: $pizza.name)
                }
                Section(header: Text("Ingredients")) {
                    TextField("Ingredients (comma seperated)", text: $pizza.ingredients)
                }
                Section(header: Text("Image Names")) {
                    TextField("Image Name", text: $pizza.imageName)
                    TextField("Thumbnail Name", text: $pizza.thumbnailName)
                }
                Section(header: Text("Type")) {
                    Picker(selection: $pizza.type, label: Text("Type")) {
                        Text("Meat").tag("meat")
                        Text("Vegetarian").tag("vegetarian")
                    }
                    .pickerStyle(SegmentedPickerStyle())
                }
                Section {
                    Button(action: {
                        pizzaStore.pizzas.append(pizza)
                        presentationMode.wrappedValue.dismiss()
                        pizzaStore.savePizzasToUserDefaults()
                        // save each time new one is added as alternative to didSet in class
                    }) {
                        Text("Add Pizza")
                    }
                    .disabled(pizza.name.isEmpty || pizza.ingredients.isEmpty || pizza.imageName.isEmpty ||
                              pizza.thumbnailName.isEmpty)
                }
                
            }
            .navigationBarTitle(Text("Add Pizza"), displayMode: .inline)
            .autocapitalization(.none)
            .toolbar {
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    }label: {
                        Text("Cancel")
                    }
                }
            }
        }
    }
}

//struct AddPizzaView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddPizzaView(pizzaStore: .environmentObject(PizzaStore), pizza: .constant(Pizza()), isPresented: .constant(false))
//    }
//}
