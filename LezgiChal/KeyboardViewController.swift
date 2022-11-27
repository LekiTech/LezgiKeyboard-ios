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
        inputSetProvider = DemoInputSetProvider()
        autocompleteProvider = DemoAutocompleteProvider()
        do {
            try calloutActionProvider = DemoKeyboardActionProvider()
        } catch {
            print("DemoKeyboardActionProvider error: \(error)")
        }
        super.viewDidLoad()
    }
    
    override func viewWillSetupKeyboard() {
        super.viewWillSetupKeyboard()
        
        // Setup the demo with demo-specific keyboard view.
        setup(with: KeyboardView())
    }

}
