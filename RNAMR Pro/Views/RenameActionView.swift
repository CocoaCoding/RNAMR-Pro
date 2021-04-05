//
//  RenameActionView.swift
//  RNAMR Pro
//
//  Created by Holger Hinzberg on 25.03.21.
//

import SwiftUI

struct RenameActionView: View {
    
    @Binding var newActionViewVisible : Bool
    
    @State private var selectedAction : RenameActionType = .replace
    @State private var selectedFirstText : String = ""
    @State private var selectedSecondText : String = ""
    
    @EnvironmentObject var controller : RenameController
    
    var body: some View {
        
        VStack {
            HStack{
                Picker("", selection: $selectedAction) {
                    ForEach (RenameActionType.allCases, id : \.self) { act in
                        Text(act.displayText)
                    }
                }.frame(width: 150)
                
                TextField("Replace Text", text: $selectedFirstText)
                    .frame(width: 250)
                
                Spacer()
            }
            
            HStack{
                Spacer()
                    .frame(width: 158)
                TextField("Replace with", text: $selectedSecondText)
                    .frame(width: 250)
                Spacer()
            }
            
            HStack{
                Button("Save", action: save)
                Button("Cancel", action: cancel)
                Spacer()
            }
        }.frame(width: 400)
    }
        
    /// Creates a new Rename action and adds it to the Controller
    private func save() {
        var action = RenameAction()
        action.firstValue = self.selectedFirstText
        action.secondValue = self.selectedSecondText
        action.actionType = self.selectedAction
        self.controller.AddAction(action: action)
        self.newActionViewVisible = false
    }
    
    private func cancel() {
        self.newActionViewVisible = false
    }    
}

struct RenameActionView_Previews: PreviewProvider {
    static var previews: some View {
        RenameActionView(newActionViewVisible: .constant(true))
    }
}
