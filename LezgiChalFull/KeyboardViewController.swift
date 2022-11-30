//
//  KeyboardViewController.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 24/11/2022.
//

import KeyboardKit
import SwiftUI

class KeyboardViewController: KeyboardInputViewController {
    
    override func viewDidLoad() {
        inputSetProvider = CustomInputSetProvider()
        autocompleteProvider = CustomAutocompleteProvider()
        keyboardAppearance = CustomKeyboardAppearance(context: keyboardContext)
        do {
            try calloutActionProvider = CustomKeyboardCalloutActionProvider()
        } catch {
            print("KeyboardViewController error: \(error)")
        }
        keyboardActionHandler = CustomKeyboardActionHandler(
            inputViewController: self)
        keyboardLayoutProvider = CustomKeyboardLayoutProvider(
            inputSetProvider: inputSetProvider)
        super.viewDidLoad()
    }
    
    override func viewWillSetupKeyboard() {
        super.viewWillSetupKeyboard()
        
        // Setup the demo with demo-specific keyboard view.
        setup(with: KeyboardView())
    }

}
