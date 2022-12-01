//
//  CuatomiPhoneKeyboardLayoutProvider.swift
//  LezgiChalFull
//
//  Created by Kamran Tadzjibov on 30/11/2022.
//

import SwiftUI
import KeyboardKit

open class CustomiPhoneKeyboardLayoutProvider: iPhoneKeyboardLayoutProvider {
    /**
     Get keyboard actions for the `inputs` and `context`.
     Note that `inputs` is an input set and does not contain
     the bottommost space key row, which we therefore append.
     */
    open override func actions(
        for inputs: InputSetRows,
        context: KeyboardContext) -> KeyboardActionRows {
        let actions = super.actions(for: inputs, context: context)
        var result = KeyboardActionRows()
        if (context.keyboardType.isAlphabetic) {
            let upper = actions[0]
            let middle1 = actions[1]
            let middle2 = actions[2]
            let lower = actions[3]
            result.append(upper)
            result.append(middle1)
            result.append(middle2)
            result.append(lowerLeadingActions(for: actions, context: context) + lower + lowerTrailingActions(for: actions, context: context))
            result.append(bottomActions(for: context))
            return result
        } else {
            return super.actions(for: inputs, context: context)
        }
    }

    open override func lowerLeadingActions(for actions: KeyboardActionRows, context: KeyboardContext) -> KeyboardActions {
        guard let switcher = keyboardSwitchActionForBottomInputRow(for: context) else { return [] }
        if isAlphabeticWithInputCount(context, [9, 11, 11, 9]) { return [switcher] }   // Lezgi
        return super.lowerLeadingActions(for: actions, context: context)
    }
    
    open override func lowerTrailingActions(for actions: KeyboardActionRows, context: KeyboardContext) -> KeyboardActions {
        if isAlphabeticWithInputCount(context, [9, 11, 11, 9]) { return [.backspace] } // Lezgi
        return super.lowerTrailingActions(for: actions, context: context)
    }
    
    open override func itemSizeWidth(
        for action: KeyboardAction,
        row: Int,
        index: Int,
        context: KeyboardContext) -> KeyboardLayoutItemWidth {
        if (context.keyboardType.isAlphabetic && row == 0) {
            return .percentage(0.11)
        } else if (context.keyboardType.isAlphabetic && (row == 1 || row == 2)) {
            return .percentage(0.09)
        } else if (context.keyboardType.isAlphabetic &&  row == 3 && index == 9) {
            /// Letter "уь"
            return .percentage(0.10)
        } else if (context.keyboardType.isAlphabetic && (action.isShiftAction || action == .backspace )) { //&&  row == 3
            /// Shift button or backspace
            return .percentage(0.085)
        } else {
            return super.itemSizeWidth(for: action, row: row, index: index, context: context)
        }
    }
}
