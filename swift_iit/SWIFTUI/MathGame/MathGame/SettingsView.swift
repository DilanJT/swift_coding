//
//  SettingsView.swift
//  Assessment
//
//  Created by Visal Rajapakse on 2023-03-20.
//

import SwiftUI

struct SettingsView: View {
    
    @ObservedObject var gameModel: GameModel
    @State private var speed = 20.0
    @State private var isEditing = false
    
    var body: some View {
        // Settings content
        VStack{
            Text("Settings")
            Text("Font size \(String(format: "%.2f",gameModel.fontSize))")
            Slider(
                value: $gameModel.fontSize,
                in: 0...30,
                onEditingChanged: { editing in
                    isEditing = editing
                }
            )
            
            HStack {
                Text("System Color").font(.system(size: gameModel.fontSize))
                Picker("Color", selection: $gameModel.selectedColor) {
                    Text(SetColors.emarald.rawValue).tag(SetColors.emarald)
                    Text(SetColors.ruby.rawValue).tag(SetColors.ruby)
                    Text(SetColors.saphire.rawValue).tag(SetColors.saphire)
                }
                .pickerStyle(.wheel)
                RoundedRectangle(cornerRadius: 10.0)
                    .frame(width:50, height: 50)
                    .foregroundColor(Color("ruby"))
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(gameModel: GameModel())
    }
}
