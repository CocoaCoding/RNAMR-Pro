//  SidebarView.swift
//  FilenameCleaner
//  Created by Holger Hinzberg on 15.03.21.

import SwiftUI

struct SidebarView: View {
    var body: some View {
        List {
            NavigationLink(destination: FolderView()) {
                Label("Folder", systemImage: "folder.fill")}
            
            NavigationLink(destination: RenameActionsListView()) {
                Label("Actions", systemImage: "list.number")}
            
            NavigationLink(destination: SettingsView()) {
                Label("Settings", systemImage: "gearshape.fill")}
            
        }.listStyle(SidebarListStyle())
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
