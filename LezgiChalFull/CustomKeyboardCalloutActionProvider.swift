//
//  DemoActionHandler.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 25/11/2022.
//

import KeyboardKit
import UIKit

class CustomKeyboardCalloutActionProvider: BaseCalloutActionProvider {
    
    override func calloutActionString(for char: String) -> String {
        var returnString: String = "";
        let isLow = String(char.prefix(1)).isLowercased
        switch char.lowercased() {
        case "уь":
            returnString = isLow ? "ю" : "Ю"
            break
        case "ш":
            returnString = isLow ? "щ" : "Щ"
            break
            //ь ы Ы
        case "ь":
            returnString = isLow ? "ы" : "Ы"
            break
        default:
            returnString = ""
            break
        }
        return returnString;
    }
    
    /// Due to ignoring capitalized combi letters in the base class had to override this function
    override func calloutActions(for action: KeyboardAction) -> [KeyboardAction] {
        switch action {
        case .character(let char):
            return calloutActions(for: char.isCapitalized ? char.uppercased() : char)
        default: return []
        }
    }
}
