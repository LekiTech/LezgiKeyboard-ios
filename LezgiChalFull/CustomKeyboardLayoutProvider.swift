//
//  CustomKeyboardLayoutProvider.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 29/11/2022.
//

import KeyboardKit

class CustomKeyboardLayoutProvider: StandardKeyboardLayoutProvider {

    override func keyboardLayout(for context: KeyboardContext) -> KeyboardLayout {
        let layout = super.keyboardLayout(for: context)
        layout.tryInsertAdditionalCharsRow(for: context.isLowercased)
        return layout
    }
}

private extension KeyboardContext {

    var isLowercased: Bool {
        keyboardType == .alphabetic(.lowercased)
    }
}

private extension KeyboardLayout {

    var bottomRowIndex: Int {
        itemRows.count - 1
    }

    var localeCharacterTemplate: KeyboardLayoutItem? {
        itemRows[bottomRowIndex].last { $0.action.isInputAction }
    }

    /// Hacky way to add additional row
    /// For unknown reason regularly adding 4th row doesn't work for AlphabeticInputSet
    func tryInsertAdditionalCharsRow(for isLowercased: Bool) {
        guard let template = localeCharacterTemplate else { return }
        let additionalRow = ["цI", "кь", "кI", "къ", "пI", "гъ", "гь", "хь", "хъ"]
            .map({(lezChar: String) -> KeyboardLayoutItem in
            return KeyboardLayoutItem(
                action: .character(isLowercased ? lezChar : lezChar.prefix(1).capitalized + lezChar.dropFirst()),
                size: template.size,
                insets: template.insets)
        })
        
        itemRows.reverse()
        itemRows.append(additionalRow)
        itemRows.reverse()
    }
}
