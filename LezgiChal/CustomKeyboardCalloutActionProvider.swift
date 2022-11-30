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
        var returnString: String = ""
        let isLow = char.isLowercased
        switch char.lowercased() {
        case "у":
            returnString = isLow ? "ю" : "Ю"
            break
        case "ш":
            returnString = isLow ? "щ" : "Щ"
            break
        case "ь":
            returnString = isLow ? "ы" : "Ы"
            break
        default:
            returnString = ""
            break
        }
        return returnString;
    }
}
