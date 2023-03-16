//
//  ContentView.swift
//  CoreDataBootcamp
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    
    @FetchRequest(entity: FruitEntity.entity(), sortDescriptors: []) var fruits: FetchedResults<FruitEntity>
    
    @State var textFieldText: String = ""
    
    var body: some View {
        NavigationView {
            VStack (spacing: 20){
                TextField("Add fruit here...", text: $textFieldText)
                    .padding(.leading)
                    .font(.headline)
                    .background(Color(red: 206, green: 219, blue: 210))
                    .padding(.horizontal)
                    .frame(maxWidth: .infinity)
                    .frame(height: 55)
                    .cornerRadius(10)
                    
                
                Button {
                    if(textFieldText != ""){
                        addItem(fruitName: textFieldText)
                    }
                } label: {
                    Text("Add")
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 55)
                        .background(Color(.blue))
                        .cornerRadius(10)
                }
                .padding(.horizontal)
                
                
                List {
                    ForEach(fruits) { fruit in
                        
                        Text(fruit.name ?? "")
                            .onTapGesture{
                                updateItems(fruit: fruit)
                            }
                        
                        
                    }
                    .onDelete(perform: deleteItems)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("Fruits")
                .navigationBarItems(
                    trailing: Button {
                        addItem(fruitName: "Orange")
                    } label: {
                        Label("Add Item", systemImage: "plus")
                    }
                
            )
            }
        }
        
    }
    
    private func addItem(fruitName: String) {
        withAnimation {
            let newFruit = FruitEntity(context: viewContext)
            newFruit.name = fruitName
            
           saveItems()
        }
    }
    
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            // offsets.map { items[$0] }.forEach(viewContext.delete)
            guard let index = offsets.first else {return}
            let fruitEntity = fruits[index]
            viewContext.delete(fruitEntity)
            
            saveItems()
        }
    }
    
    private func updateItems(fruit: FruitEntity) {
        withAnimation {
            let currentName = fruit.name ?? ""
            let newName = currentName + "!"
            fruit.name = newName
            
            saveItems()
        }
    }
    
    private func saveItems() {
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
