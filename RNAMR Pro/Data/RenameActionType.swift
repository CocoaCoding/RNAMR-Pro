//  RenameActions.swift
//  RNAMR Pro
//  Created by Holger Hinzberg on 25.03.21.

import Foundation

enum RenameActionType  : CaseIterable, Codable {
    
    enum CodingKeys: CodingKey {
        case addStartKey, removeKey, replaceKey
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let key = container.allKeys.first
        
        switch key {
        case .addStartKey:
            self = .addStart
        case .removeKey:
            self = .remove
        case .replaceKey:
            self = .replace
        default:
            throw DecodingError.dataCorrupted(
                DecodingError.Context(
                    codingPath: container.codingPath,
                    debugDescription: "Unabled to decode enum."
                )
            )
        }
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        switch self {
        case .addStart:
            try container.encode(true, forKey: .addStartKey)
        case .remove:
            try container.encode(true, forKey: .removeKey)
        case .replace:
            try container.encode(true, forKey: .replaceKey)
        }
    }
    
    case addStart
    case remove
    case replace
    
    var displayText : String {
        switch self {
        case .addStart:
            return "Add at start"
        case .remove:
            return "Remove"
        case .replace:
            return "Replace"
        }
    }
}
