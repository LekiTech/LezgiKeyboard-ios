//
//  CustomiPadKeyboardLayoutProvider.swift
//  LezgiChalFull
//
//  Created by Kamran Tadzjibov on 30/11/2022.
//

import SwiftUI
import KeyboardKit

// TODO: fix correct implementation and test in simulator
open class CustomiPadKeyboardLayoutProvider: iPadKeyboardLayoutProvider {
    let customMarginAction = KeyboardAction.characterMargin("")
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
            var upper = actions[0]
            upper.insert(.escape, at: 0)
            upper.append(.backspace)
            var middle1 = actions[1]
            middle1.insert(.tab, at: 0)
//            middle1.append(customMarginAction)
            var middle2 = actions[2]
            middle2.insert(customMarginAction, at: 0)
            middle2.append(.return)
            let lower = actions[3]
            
            result.append(upper)
            result.append(middle1)
            result.append(middle2)
            result.append(lowerLeadingActions(for: context) + lower + lowerTrailingActions(for: context))
            result.append(bottomActions(for: context))
            return result
        } else {
            return super.actions(for: inputs, context: context)
        }
    }
    
    open override func itemSizeWidth(
        for action: KeyboardAction,
        row: Int,
        index: Int,
        context: KeyboardContext) -> KeyboardLayoutItemWidth {
        /// First fix size for specific buttons
        if (context.keyboardType.isAlphabetic && action == customMarginAction && (row == 1 || row == 2)) {
            return .percentage(0.04)
        } else if (context.keyboardType.isAlphabetic && (action.isShiftAction || action == .escape)) {
            return .percentage(0.082)
        } else if (context.keyboardType.isAlphabetic && (action == .tab)) {
            return .percentage(0.06)
        } else if (context.keyboardType.isAlphabetic && (action == .return || action == .backspace)) {
            return .percentage(0.07)
        }
        /// If no specific buttons were matched, fix size for rows
        else if (context.keyboardType.isAlphabetic && row == 0) {
            return .percentage(0.077)
        } else if (context.keyboardType.isAlphabetic && row == 1) {
            return .percentage(0.072)
        } else if (context.keyboardType.isAlphabetic && row == 2) {
            return .percentage(0.08)
        } else {
            return super.itemSizeWidth(for: action, row: row, index: index, context: context)
        }
    }
}
