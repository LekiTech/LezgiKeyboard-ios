//
//  DemoInputSetProvider.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 25/11/2022.
//

import KeyboardKit

class DemoInputSetProvider: InputSetProvider {
    
    let baseProvider = EnglishInputSetProvider()

    /*
     йцукенгшщзхъ
     фывапролджэ
     ячсмитьбюI

     ЙЦУКЕНГШЩЗХЪ
     ФЫВАПРОЛДЖЭ
     ЯЧСМИТЬБЮI
     */
    var alphabeticInputSet: AlphabeticInputSet {
        AlphabeticInputSet(rows: [
            .init(lowercased: "йцукенгшзхъ", uppercased: "ЙЦУКЕНГШЗХЪ"),
            .init(lowercased: "фвапролджэ", uppercased: "ФВАПРОЛДЖЭ"),
            .init(
                phoneLowercased: "ячсмитьбI",
                phoneUppercased: "ЯЧСМИТЬБI",
                padLowercased: "ячсмитьбI,.",
                padUppercased: "ЯЧСМИТЬБI,.")
        ])
    }
    
    var numericInputSet: NumericInputSet {
        baseProvider.numericInputSet
    }
    
    var symbolicInputSet: SymbolicInputSet {
        baseProvider.symbolicInputSet
    }
}
