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
        let result = AlphabeticInputSet(rows: [
            .init(lowercased: "йцукенгшъзх", uppercased: "ЙЦУКЕНГШЪЗХ"),
            .init(lowercased: "фIвапролджэ", uppercased: "ФIВАПРОЛДЖЭ"),
            .init(
                phoneLowercased: "ячсмитьб",
                phoneUppercased: "ЯЧСМИТЬБ",
                padLowercased: "ячсмитьб,.",
                padUppercased: "ЯЧСМИТЬБ,.")
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
