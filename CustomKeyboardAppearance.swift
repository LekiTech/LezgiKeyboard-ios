//
//  CustomKeyboardAppearance.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 29/11/2022.
//

import Foundation
import KeyboardKit

class CustomKeyboardAppearance: StandardKeyboardAppearance {
    
    override func buttonText(for action: KeyboardAction) -> String? {
        switch action {
        case .return:
            return "⮐"
        case .space:
            return "Лезги чIал"
        default:
            return super.buttonText(for: action)
        }
    }
}
