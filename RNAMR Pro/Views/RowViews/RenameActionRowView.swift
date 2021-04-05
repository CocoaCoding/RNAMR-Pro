//  RenameActionRowView.swift
//  RNAMR Pro
//  Created by Holger Hinzberg on 25.03.21.

import SwiftUI

struct RenameActionRowView: View {
    
    var action : RenameAction
    
    var body: some View {
        if self.action.actionType == .replace {
            let text = "Replace \(action.firstValue) with \(action.secondValue)"
            Text(text)
        }
    }
}

struct RenameActionRowView_Previews: PreviewProvider {
    static var previews: some View {
        RenameActionRowView(action: RenameAction())
    }
}
