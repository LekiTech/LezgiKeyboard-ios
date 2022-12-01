//
//  CustomKeyboardLayoutProvider.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 29/11/2022.
//

import KeyboardKit

class CustomKeyboardLayoutProvider: StandardKeyboardLayoutProvider {
    
    private lazy var _iPhoneProvider: iPhoneKeyboardLayoutProvider = CustomiPhoneKeyboardLayoutProvider(
        inputSetProvider: inputSetProvider,
        dictationReplacement: dictationReplacement)
    override var iPhoneProvider: iPhoneKeyboardLayoutProvider {
        get { return _iPhoneProvider }
        set { _iPhoneProvider = newValue }
    }
    
    private lazy var _iPadProvider: iPadKeyboardLayoutProvider = CustomiPadKeyboardLayoutProvider(
        inputSetProvider: inputSetProvider,
        dictationReplacement: dictationReplacement)
    override var iPadProvider: iPadKeyboardLayoutProvider {
        get { return _iPadProvider }
        set { _iPadProvider = newValue }
    }
}
