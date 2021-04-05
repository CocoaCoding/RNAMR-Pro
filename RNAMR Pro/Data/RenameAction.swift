//  RenameAction.swift
//  RNAMR Pro
//  Created by Holger Hinzberg on 25.03.21.

import Foundation

// This class is a represetation of a rename action.
// The RenameActionType tell what should be done
// firstValue will be replaced with secondValue

public struct RenameAction : Codable {
    var actionType : RenameActionType = .replace
    var firstValue : String = ""
    var secondValue : String = ""
    public var id = UUID()
}

