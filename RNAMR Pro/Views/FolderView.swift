//
//  DummyView.swift
//  FilenameCleaner
//
//  Created by Holger Hinzberg on 15.03.21.
//

import SwiftUI

struct FolderView: View {
    
    @EnvironmentObject var controller : RenameController

    var body: some View {
        
        VStack {
            VStack {
                List {
                    ForEach (controller.items, id: \.id) { item in
                        FileRenameTableRowView(item: item)
                    }
                }
//                VStack{
//                    Text("\(self.downloadItemRepository.itemsCountText)")
//                }
            }.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        
        
    }
}

struct DummyView_Previews: PreviewProvider {
    static var previews: some View {
        FolderView()
    }
}
