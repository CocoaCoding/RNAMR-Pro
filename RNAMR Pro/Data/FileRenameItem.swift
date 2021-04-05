//  FileRenameItem.swift
//  Filename Cleaner
//  Created by Holger Hinzberg on 22.03.21.

import Cocoa

// This class is a reprensentation of a rename action
// and kind of a ViewModel.
// It will display the original FileName and the new Filename with all Rename actions applied

class FileRenameItem
{
    public var id = UUID()
    public var originalName : String = ""
    public var changedName : String = ""
    public var isDirectory : Bool = false
    public var url : URL?
    
    init(url : URL) {
        self.url = url
    }
}

