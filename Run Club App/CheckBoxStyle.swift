//
//  CheckBoxStyle.swift
//  Run Club App
//
//  Created by Vladimir Sukhikh on 2022-08-26.
//

import SwiftUI

struct CheckBoxStyle: ToggleStyle {    
    func makeBody(configuration: Self.Configuration) -> some View {
            return HStack {
                Image(systemName: configuration.isOn ? "checkmark.square" : "square")
                    .resizable()
                    .frame(width: 16, height: 16)
                    .font(.system(size: 20, weight: .regular, design: .default))
                    configuration.label
            }
            .onTapGesture { configuration.isOn.toggle() }
    }
}
