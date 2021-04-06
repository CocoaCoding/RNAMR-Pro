//  RenameActionRowView.swift
//  RNAMR Pro
//  Created by Holger Hinzberg on 25.03.21.

import SwiftUI

struct RenameActionRowView: View {
    
    var action : RenameAction
    var deleteAction : (RenameAction) -> Void
    
    @State private var overText = false
    
    var body: some View {
        HStack{
            if self.action.actionType == .replace {
                let text = "Replace \(action.firstValue) with \(action.secondValue)"
                Text(text)
            }
            else if self.action.actionType == .remove {
                let text = "Remove \(action.firstValue)"
                Text(text)
            }
            
            Spacer()
            
            Button(action: {deleteAction(self.action) }) {
                Image(systemName: "minus.circle")
                    .resizable()
                    .frame(width: 17, height: 17)
            }.buttonStyle(DeleteButtonStyle())
        
        }.padding(0)
        .foregroundColor(overText ? Color.accentColor : Color.primary)
        .onHover { over in
            overText = over }
    }
}

struct RenameActionRowView_Previews: PreviewProvider {
    
    private static func delete( action : RenameAction  ) {
    }
    
    static var previews: some View {
        RenameActionRowView(action: RenameAction(), deleteAction: delete )
    }
}
