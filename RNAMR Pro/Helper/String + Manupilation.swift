//
//  String + Manupilation.swift
//  RNAMR Pro
//
//  Created by Holger Hinzberg on 06.04.21.
//

import Cocoa

import Foundation

extension String
{
    func replace(replaceText : String,  with : String) -> String
    {
        let replaced = self.replacingOccurrences(of: replaceText, with: with)
        return replaced
    }
}
