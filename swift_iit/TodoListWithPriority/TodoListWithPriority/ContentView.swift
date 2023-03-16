//
//  ContentView.swift
//  TodoListWithPriority
//
//  Created by Dilan Jayamanne on 2023-03-15.
//

import SwiftUI

struct ContentView: View {
    
    @State private var todoName: String = ""
    @State private var todoDescription: String = ""
    @State private var prorityLevel: String = ""
    
    @State private var speed = 5.0
    @State private var isEditing = false
    
    @AppStorage("todos") private var todos: [TodoItem] = []
    
    @State private var showView: Bool = true
    
    var body: some View {
       
            VStack {
                if(showView){
                    DataEntryView(
                        todoName: $todoName, todoDescription: $todoDescription, speed: $speed, isEditing: $isEditing, todos: $todos, showView: $showView
                    )
                }
                    
    //            .tint(.blue)
                
                
                
                Divider()
                
                List {
                    ForEach(todos){ item in
                        Text("\(item.taskName) \n")
                            .font(.headline)
                        + Text("\(item.taskDescription) \n")
                            .font(.subheadline)
                        + Text("Priority: \(String(format: "%.2f", item.priorityLevel))")
                            .font(.subheadline)
                    }
                }
                
                if(!showView) {
                    Button {
                        showView = !showView
                    } label: {
                        Text("toggle view")
                    }
                    .multilineTextAlignment(.center)
                }
                
            }
            .padding()
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct DataEntryView: View {
    
    @Binding var todoName: String
    @Binding var todoDescription: String
    @Binding var speed: Double
    @Binding var isEditing: Bool
    @Binding var todos: [TodoItem]
    @Binding var showView: Bool
    
    var body: some View {
        Section {
            Text("ToDo's")
            TextField("Task name", text: $todoName)
                .padding()
                .overlay(RoundedRectangle(cornerRadius:
                                            2.5).strokeBorder(Color.black,
                                                              style: StrokeStyle(lineWidth: 2.0)))
            TextField("Task description", text: $todoDescription)
                .padding()
                .overlay(RoundedRectangle(cornerRadius:
                                            2.5).strokeBorder(Color.black,
                                                              style: StrokeStyle(lineWidth: 2.0)))
            
            Text("Task prority \(String(format: "%.2f", speed))")
            
            
            Slider(
                    value: $speed,
                    in: 0...10,
                    step: 1
                ) {
                    Text("Speed")
                } minimumValueLabel: {
                    Text("0")
                } maximumValueLabel: {
                    Text("10")
                } onEditingChanged: { editing in
                    isEditing = editing
                }
            Text("\(String(format: "%.2f", speed))")
                    .foregroundColor(isEditing ? .red : .blue)
            
            HStack{
                Button{
                    self.todoName = ""
                    self.todoDescription = ""
                    self.speed = 5.0
                } label: {
                    Text("clear")
                }
                .buttonStyle(.borderedProminent)
                
                Button{
                    
                    let todoItemObject: TodoItem = TodoItem(name: todoName, description: todoDescription, priority: speed)
                    
                    todos.append(todoItemObject)
                    
                    print("todo count", todos.count)
                    
                    if(todos.count > 5) {
                        self.showView = false
                    }
                    
                } label: {
                    Text("Add item")
                }
                .buttonStyle(.borderedProminent)
            }
        }
    }
}
