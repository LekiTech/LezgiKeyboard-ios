//
//  DemoInputSetProvider.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 25/11/2022.
//

import KeyboardKit

class CustomInputSetProvider: InputSetProvider {
    
    let baseProvider = EnglishInputSetProvider()

    var alphabeticInputSet: AlphabeticInputSet {
        let result: AlphabeticInputSet
        let firstRow = ["й", "ц", "у", "к", "е", "н", "г", "ш", "тI", "з", "х"]
        let secondRow = ["ф", "чI","в","а","п","р","о","л","д","ж","э"]
        let thirdRowPhone = ["я", "ч", "с", "м", "и", "т", "ь", "б", "уь"]
        let thirdRowPad = ["я", "ч", "с", "м", "и", "т", "ь", "б", "уь", ",", "."]
        result = AlphabeticInputSet(rows: [
            .init(firstRow.map({ myChar in
                InputSetItem.init(neutral: myChar, uppercased: myChar.prefix(1).capitalized + myChar.dropFirst(), lowercased: myChar)
            })),
            .init(secondRow.map({ myChar in
                InputSetItem.init(neutral: myChar, uppercased: myChar.prefix(1).capitalized + myChar.dropFirst(), lowercased: myChar)
            })),
            .init(thirdRowPhone.map({ myChar in
                InputSetItem.init(neutral: myChar, uppercased: myChar.prefix(1).capitalized + myChar.dropFirst(), lowercased: myChar)
            })),
            // TODO: fix something for thirdRowPad row
//            .init(
//                phoneLowercased: "ячсмитьб",
//                phoneUppercased: "ЯЧСМИТЬБ",
//                padLowercased: "ячсмитьб,.",
//                padUppercased: "ЯЧСМИТЬБ,.")
        ])
        return result
    }
    
    var numericInputSet: NumericInputSet {
        baseProvider.numericInputSet
    }
    
    var symbolicInputSet: SymbolicInputSet {
        baseProvider.symbolicInputSet
    }
}
