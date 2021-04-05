//  URL + Helper.swift
//  Filename Cleaner
//  Created by Holger Hinzberg on 22.03.21.

import SwiftUI

extension URL {
    var isDirectory: Bool {
       return (try? resourceValues(forKeys: [.isDirectoryKey]))?.isDirectory == true
    }
}
