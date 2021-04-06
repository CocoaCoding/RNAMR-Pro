//  DeleteButtonStyle.swift
//  RNAMR Pro
//  Created by Holger Hinzberg on 06.04.21.

import SwiftUI

struct DeleteButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(0)
            .foregroundColor(configuration.isPressed ? Color.red.opacity(0.5) : .red)
     }
}
