//
//  RNAMR_ProApp.swift
//  RNAMR Pro
//
//  Created by Holger Hinzberg on 25.03.21.
//

import SwiftUI

@main
struct RNAMR_ProApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var controller = RenameController()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                SidebarView()
                FolderView()
            }
            .toolbar {
                ToolbarItem(placement: .navigation) {
                    Button(action: { ToggleSidebar() })
                        { Image(systemName: "sidebar.left")}}
                
                ToolbarItem(placement: .primaryAction) {
                    Button(action: { self.controller.reload() })
                        { Image(systemName: "repeat.circle")}}
                
                ToolbarItem(placement: .primaryAction) {
                    
                    Button(action: { self.controller.executeRename() })
                        { Image(systemName: "play.fill") }}

            }.environmentObject(controller)
        }
    }
    
    func ToggleSidebar() {
        NSApp.keyWindow?.firstResponder?.tryToPerform(#selector(NSSplitViewController.toggleSidebar(_:)), with: nil)
    }
}
