//
//  DemoInputSetProvider.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 25/11/2022.
//

import KeyboardKit

class CustomInputSetProvider: InputSetProvider {
    
    let baseProvider = EnglishInputSetProvider()
    
    let specCharMapping = [
        "[": "{",
        "]": "}",
        ";": ":",
        "'": "\"",
        ",": "<",
        ".": ">",
        "/": "?",
    ]

    var alphabeticInputSet: AlphabeticInputSet {
        let result: AlphabeticInputSet
        let customFirstRow = ["цI", "кь", "кI", "къ", "пI", "гъ", "гь", "хь", "хъ"]
        let customFirstRowPad = ["цI", "кь", "кI", "къ", "пI", "гъ", "гь", "хь", "хъ", "[", "]"]
        let firstRow = ["й", "ц", "у", "к", "е", "н", "г", "ш", "тI", "з", "х"]
        let firstRowPad = ["й", "ц", "у", "к", "е", "н", "г", "ш", "тI", "з", "х", ";", "'"]
        let secondRow = ["ф", "чI","в","а","п","р","о","л","д","ж","э"]
        let thirdRowPhone = ["я", "ч", "с", "м", "и", "т", "ъ", "б", "уь"]
        let thirdRowPad = ["я", "ч", "с", "м", "и", "т", "ъ", "б", "уь", ",", ".", "/"]
        result = AlphabeticInputSet(rows: [
//            .init(customFirstRow.map({ myChar in mapStringToInputSetItem(myChar: myChar) })),
            .init(
                phoneLowercased: customFirstRow,
                phoneUppercased: customFirstRow.map({ myChar in capitalizeCorrectly(myChar: myChar) }),
                padLowercased: customFirstRowPad,
                padUppercased: customFirstRowPad.map({ myChar in capitalizeCorrectly(myChar: myChar) })
            ),
//            .init(firstRow.map({ myChar in mapStringToInputSetItem(myChar: myChar) })),
            .init(
                phoneLowercased: firstRow,
                phoneUppercased: firstRow.map({ myChar in capitalizeCorrectly(myChar: myChar) }),
                padLowercased: firstRowPad,
                padUppercased: firstRowPad.map({ myChar in capitalizeCorrectly(myChar: myChar) })
            ),
            .init(secondRow.map({ myChar in mapStringToInputSetItem(myChar: myChar) })),
            .init(
                phoneLowercased: thirdRowPhone,
                phoneUppercased: thirdRowPhone.map({ myChar in capitalizeCorrectly(myChar: myChar) }),
                padLowercased: thirdRowPad,
                padUppercased: thirdRowPad.map({ myChar in capitalizeCorrectly(myChar: myChar) })
            )
        ])
        return result
    }
    
    func capitalizeCorrectly(myChar: String) -> String {
        if (specCharMapping[myChar] != nil) {
            return specCharMapping[myChar]!
        } else {
            return myChar.prefix(1).capitalized + myChar.dropFirst()
        }
    }
    
    func mapStringToInputSetItem(myChar: String) -> InputSetItem {
        return InputSetItem.init(neutral: myChar, uppercased: capitalizeCorrectly(myChar: myChar), lowercased: myChar)
    }
    
    var numericInputSet: NumericInputSet {
        baseProvider.numericInputSet
    }

    var symbolicInputSet: SymbolicInputSet {
        baseProvider.symbolicInputSet
    }
}
