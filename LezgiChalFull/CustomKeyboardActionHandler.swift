//
//  CustomKeyboardActionHandler.swift
//  LezgiChalFull
//
//  Created by Kamran Tadzjibov on 29/11/2022.
//

import KeyboardKit
import UIKit

class CustomKeyboardActionHandler: StandardKeyboardActionHandler {
    
    public init(inputViewController: KeyboardInputViewController) {
        super.init(inputViewController: inputViewController)
    }
    
    
    func isEndingOnCombinedLetter() -> Bool {
        if (textDocumentProxy.hasCurrentWord == true
            && textDocumentProxy.currentWord != nil
            && textDocumentProxy.currentWord!.count >= 2
        ) {
            let word = textDocumentProxy.currentWord!
            let suffix = word.suffix(2).uppercased()
            if (["ЧI","УЬ","ЦI","КЬ","КI","КЪ","ПI","ТI","ГЪ","ГЬ","ХЬ","ХЪ"].contains(suffix)) {
                return true
            }
        }
        return false
    }
    
    // MARK: - Overrides
    
    override func action(for gesture: KeyboardGesture, on action: KeyboardAction) -> KeyboardAction.GestureAction? {
        let standard = super.action(for: gesture, on: action)
        return standard
    }
    
    override func handle(_ gesture: KeyboardGesture, on action: KeyboardAction) {
        // Customize the action handling if needed
//        UINotificationFeedbackGenerator().notificationOccurred(.success)s
        if (gesture == .tap && action == .backspace && isEndingOnCombinedLetter()) {
            textDocumentProxy.deleteBackward(times: 2)
        } else {
            super.handle(gesture, on: action)
        }
    }
}
