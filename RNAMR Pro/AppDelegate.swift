//  AppDelegate.swift
//  Filename Cleaner
//  Created by Holger Hinzberg on 22.03.21.

import SwiftUI

class AppDelegate: NSObject, NSApplicationDelegate {
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        FileBookmarkHandler.shared.loadBookmarks()
    }
    
}
