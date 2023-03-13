//
//  ContentView.swift
//  ToDoStateManagement
//
//  Created by Dilan Jayamanne on 2023-03-13.
//

import SwiftUI


struct TodoListView: View {
    
    // here we are referencing the observable object by not letting this struct the owner of the ObeservableObject by mentioning @StateObject
    @ObservedObject var todoManager: ToDoListManager
    
    var body: some View {
        NavigationView{
            List{
                ForEach(todoManager.items) { item in
                    NavigationLink (
                        destination: Text("Destination \(item.name)"),
                        label: {
                            Text(item.name)
                        })
                    
                }
                .onDelete(perform: { indexSet in
                    todoManager.delete(at: indexSet)
                })
                .onMove(perform: {indices, newOffset in
                    todoManager.move(indices: indices, newOffset: newOffset)
                })
            }
            .navigationBarTitle(Text("ToDo's"), displayMode: .large)
            .toolbar(content: {
                ToolbarItemGroup(placement: .navigationBarTrailing){
                    EditButton()
                    
                    Button(action: {
                        todoManager.addItem(item: Item(id: UUID(), name:"newly added"))
                    }, label: {
                        Image(systemName: "plus")
                    })
                    
                }
            })
        }
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TodoListView(todoManager: ToDoListManager())
    }
}
