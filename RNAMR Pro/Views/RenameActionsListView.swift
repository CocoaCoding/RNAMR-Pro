//
//  RenameActionsListView.swift
//  RNAMR Pro
//
//  Created by Holger Hinzberg on 25.03.21.
//

import SwiftUI

struct RenameActionsListView: View {
    
    @EnvironmentObject var controller : RenameController
    @State var newActionViewVisible = false
    
    var body: some View {
        VStack {
            HStack{
                Button("New Action", action: newAction)
                Spacer()
            }.padding()
            
            if  self.newActionViewVisible {
                RenameActionView(newActionViewVisible: $newActionViewVisible)
            }
            
            VStack {
                List {
                    ForEach (controller.actions, id: \.id) { action in
                        RenameActionRowView(action: action, deleteAction: self.delete)
                    }
                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
            
            Spacer()
        }
    }
    
    private func delete(action : RenameAction ) {
        self.controller.DeleteAction(action: action)
    }
    
    private func newAction() {
        self.newActionViewVisible = true
    }
}

struct RenameActionsListView_Previews: PreviewProvider {
    static var previews: some View {
        RenameActionsListView()
    }
}
