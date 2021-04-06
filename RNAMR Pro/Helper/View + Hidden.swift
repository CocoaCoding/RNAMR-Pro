//  View + Hidden.swift
//  RNAMR Pro
//  Created by Holger Hinzberg on 06.04.21.

import SwiftUI

extension View {
    
    @ViewBuilder func hidden(_ shouldHide: Bool) -> some View {
        switch shouldHide {
        case true: self.hidden()
        case false: self
        }
    }
}
