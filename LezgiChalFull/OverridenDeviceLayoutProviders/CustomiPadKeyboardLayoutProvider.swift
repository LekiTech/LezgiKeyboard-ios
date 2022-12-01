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
    /**
         Get keyboard actions for the `inputs` and `context`.
         Note that `inputs` is an input set and does not contain
         the bottommost space key row, which we therefore append.
         */
        open override func actions(
            for inputs: InputSetRows,
            context: KeyboardContext) -> KeyboardActionRows {
            let actions = super.actions(for: inputs, context: context)
//            guard actions.count == 3 else { return actions }
            var result = KeyboardActionRows()
            result.append(topLeadingActions(for: context) + actions[0] + topTrailingActions(for: context))
            result.append(middleLeadingActions(for: context) + actions[1] + middleTrailingActions(for: context))
            result.append(lowerLeadingActions(for: context) + actions[2] + lowerTrailingActions(for: context))
            result.append(bottomActions(for: context))
            return result
        }
}
