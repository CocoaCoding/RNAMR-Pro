//  Dummy2View.swift
//  FilenameCleaner
//  Created by Holger Hinzberg on 15.03.21.

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.openURL) var openURL
    @AppStorage("sourcePath") var sourcePathString = ""
    @AppStorage("destinationPath") var destinationPathString = ""
    
    var body: some View {
        
        VStack {
            VStack {
                
                HStack{
                    Text("Source path")
                    Spacer()
                }
                
                HStack{
                    TextField("Select source path", text: $sourcePathString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: self.pickSourceFolder, label: {
                        Text("...")
                    })
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                HStack{
                    Text("Destination path")
                    Spacer()
                }
                
                HStack{
                    TextField("Select destination path", text: $destinationPathString)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Button(action: self.pickDestinationFolder, label: {
                        Text("...")
                    })
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 10, trailing: 0))
                
                Text("If source path and destination path are the same all files will be renamed in place.")
                
                Spacer()
            }.padding()
        }
    }
    
    func pickSourceFolder()
    {
        self.pickFolder(pathString: sourcePathString) { url in
            if let url = url {
                self.sourcePathString = url.path
            }
        }
    }
        
    func pickDestinationFolder()
    {
        self.pickFolder(pathString: destinationPathString) { url in
            if let url = url {
                self.destinationPathString = url.path
            }
        }
    }
    
    func pickFolder(pathString : String , action: @escaping (URL?) -> Void)  {
        let initDictectory = NSURL(fileURLWithPath: pathString)
        let openPanel = NSOpenPanel()
        openPanel.canChooseDirectories = true
        openPanel.canChooseFiles = false
        openPanel.canCreateDirectories = false
        openPanel.allowsMultipleSelection = false
        openPanel.directoryURL = initDictectory as URL
        
        openPanel.begin{ (result) -> Void in
            if result.rawValue == NSApplication.ModalResponse.OK.rawValue
            {
                action(openPanel.url)
                FileBookmarkHandler.shared.storeFolderInBookmark(url: openPanel.url!)
                FileBookmarkHandler.shared.saveBookmarksData()
            }
        }
    }
}

struct Dummy2View_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
