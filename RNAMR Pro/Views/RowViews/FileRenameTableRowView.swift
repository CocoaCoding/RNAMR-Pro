//  FileRenameTableRowView.swift
//  Filename Cleaner
//  Created by Holger Hinzberg on 22.03.21.

import SwiftUI

struct FileRenameTableRowView: View {
    
    var item : FileRenameItem
    
    var body: some View {
        
        HStack{
            
            if (item.isDirectory) {
                Image(systemName: "folder.fill")
                    .foregroundColor(.accentColor)
            } else {
                Image(systemName: "doc")
                    .foregroundColor(.accentColor)
            }
            
            VStack{
                Text(item.originalName).font(.subheadline).foregroundColor(Color.secondary)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(item.changedName).font(.subheadline).foregroundColor(Color.primary)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }.padding(EdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0))
        }
    }
}

struct FileRenameTableRowView_Previews: PreviewProvider {
    static var previews: some View {
        FileRenameTableRowView(item: FileRenameItem(url: URL(fileURLWithPath: "")))
    }
}
