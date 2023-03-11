//
//  PizzaList.swift
//  PizzaApplication
//
//  Created by Dilan Jayamanne on 2023-03-10.
//

import SwiftUI


struct PizzaList: View {
    @ObservedObject var viewModel : PizzaViewModel
        
        @State private var isSheetShowing = false
        @State private var selectedIndex = 0

        var body: some View {
            
            NavigationStack{
                VStack{
                    Picker("Pizza", selection: $selectedIndex){
                        Text("All").tag(0)
                        Text("Meat").tag(1)
                        Text("Veggie").tag(2)
                    }
                    .pickerStyle(.segmented)
                    
                    List {
                        if selectedIndex == 0 {
                            ForEach(viewModel.savedPizzaData) { pizza in
                                HStack {
                                    Image("\(pizza.imageName ?? "")")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    
                                    Text("\(pizza.name ?? "")")
                                }
                            }
                        }else if selectedIndex == 1 {
                            ForEach(viewModel.savedPizzaData) { pizza in
                                HStack {
                                    Image("\(pizza.imageName ?? "")")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    
                                    Text("\(pizza.name ?? "")")
                                }
                            }
                        }else {
                            ForEach(viewModel.savedPizzaData) { pizza in
                                HStack {
                                    Image("\(pizza.imageName ?? "")")
                                        .resizable()
                                        .frame(width: 100, height: 100)
                                    
                                    Text("\(pizza.name ?? "")")
                                }
                            }
                        }
                        
                    }
                }
                .navigationTitle("Pizzas")
                .toolbar{
                    ToolbarItem{
                        Button {
                            isSheetShowing.toggle()
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
                .sheet(isPresented: $isSheetShowing) {
                    AddNewPizza(viewModel: viewModel)
                }

            }
        }
}

struct PizzaList_Previews: PreviewProvider {
    static var previews: some View {
        PizzaList(viewModel: PizzaViewModel())
    }
}


