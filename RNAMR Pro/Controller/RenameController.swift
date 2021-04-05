//  FileRenameController.swift
//  Filename Cleaner
//  Created by Holger Hinzberg on 22.03.21.

import SwiftUI

public class RenameController : ObservableObject {
    
    // Filename to save and load the RenameActions
    private let actionsFileName : String = "actions.json"
    
    @AppStorage("sourcePath") var sourcePathString = ""
    
    // Represents old and new filenames
    @Published var items = [FileRenameItem]()
    
    // Actions that should be appied to the files
    @Published var actions = [RenameAction]()
    
    init() {
        if (self.checkActionsFileExists() == true) {
            self.loadRenameActions()
        }
    }
    
    public func reload() {
        
        self.items.removeAll()
        
        let fileMan = FileManager.default
        
        do {
            
            let fileUrl = URL(fileURLWithPath: sourcePathString)
            let urls : [URL] = try fileMan.contentsOfDirectory(at: fileUrl, includingPropertiesForKeys: nil, options: .skipsHiddenFiles)
            
            for url in urls {
                let fileItem = FileRenameItem(url: url)
                fileItem.originalName = url.lastPathComponent
                fileItem.changedName = url.lastPathComponent
                fileItem.isDirectory = url.isDirectory
                self.items.append(fileItem)
            }
            
        } catch {
            // failed to read directory – bad permissions, perhaps?
        }
    }
    
    public func AddAction(action : RenameAction) {
        // Add Action
        self.actions.append(action)
        // Save all actions
        self.saveRenameActions()
    }
    
    // MARK: File Operations
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentsDirectory = paths[0]
        return documentsDirectory
    }
    
    func checkActionsFileExists() -> Bool {
        let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0] as String
        let url = NSURL(fileURLWithPath: path)
        if let pathComponent = url.appendingPathComponent(self.actionsFileName) {
            let filePath = pathComponent.path
            let fileManager = FileManager.default
            if fileManager.fileExists(atPath: filePath) {
                print("FILE AVAILABLE")
                return true
            } else {
                print("FILE NOT AVAILABLE")
            }
        } else {
            print("FILE PATH NOT AVAILABLE")
        }
        return false
    }
    
    func saveRenameActions() {

        let encoder = JSONEncoder()

        do {
            let data = try encoder.encode(actions)
            let s = String(data: data, encoding: .utf8)!
            let filename = getDocumentsDirectory().appendingPathComponent(self.actionsFileName)
            try s.write(to: filename, atomically: true, encoding: .utf8)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func loadRenameActions() {
        
        let filename = getDocumentsDirectory().appendingPathComponent(self.actionsFileName)
       
        let decoder = JSONDecoder()
        do {
            let loadedText = try String(contentsOf: filename, encoding: .utf8)
            let jsonData = loadedText.data(using: .utf8)!
            let loadedActions = try decoder.decode([RenameAction].self, from: jsonData)
            self.actions.removeAll()
            self.actions.append(contentsOf: loadedActions)
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    public func executeRename() {}
    
}
