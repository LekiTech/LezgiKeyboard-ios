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
        case .primary(.done):
            return "Хьанва"
        case .primary(.go):
            return "ЭлячIун"
        case .primary(.ok):
            return "Хьурай"
        case .return:
            return "⮐"
        case .escape:
            return "esc"
        case .primary(.search):
            return "Жугъурун"
        case .space:
            return "Лезги чIал"
        case .keyboardType(.alphabetic(.uppercased)):
            return "АБВ"
        case .keyboardType(.alphabetic(.capsLocked)):
            return "АБВ"
        case .keyboardType(.alphabetic(.lowercased)):
            return "абв"
        case .keyboardType(.alphabetic(.auto)):
            return "АБВ"
        case .keyboardType(.numeric):
            return "123"
        case .keyboardType(.symbolic):
            return "#+="
        /// potentially resolves emoji switch bug
        case .keyboardType(.emojis):
           return "😆"
        default:
            return super.buttonText(for: action)
        }
    }
    // TODO buttonImage
    /*
     отово - Хьанва
     Эляч1ун - Перейти
     Хьурай - ок
     case .keyboardType(.emojis):
        return "😆"
     */
}
