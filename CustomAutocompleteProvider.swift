//
//  AutocompleteProvide.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 25/11/2022.
//

import Foundation
import KeyboardKit

class CustomAutocompleteProvider: AutocompleteProvider {

    init(match: String = "match") {
        self.match = match
    }

    private var match: String
    
    var locale: Locale = .current
    
    var canIgnoreWords: Bool { false }
    var canLearnWords: Bool { false }
    var ignoredWords: [String] = []
    var learnedWords: [String] = []
    
    func hasIgnoredWord(_ word: String) -> Bool { false }
    func hasLearnedWord(_ word: String) -> Bool { false }
    func ignoreWord(_ word: String) {}
    func learnWord(_ word: String) {}
    func removeIgnoredWord(_ word: String) {}
    func unlearnWord(_ word: String) {}
    
    func autocompleteSuggestions(for text: String, completion: AutocompleteCompletion) {
        guard text.count > 0 else {
            return completion(.success([]))
//                StandardAutocompleteSuggestion(text: "Зи"),
//                StandardAutocompleteSuggestion(text: "Ви"),
//                StandardAutocompleteSuggestion(text: "Зун"),
//                StandardAutocompleteSuggestion(text: "Вун")
        }
        if text == match {
            completion(.success(matchSuggestions()))
        } else {
            completion(.success(suggestions(for: text)))
        }
    }
}

private extension CustomAutocompleteProvider {
    
    func suggestions(for text: String) -> [AutocompleteSuggestion] {
        let isCap = String(text.prefix(1)).isUppercased
        let suggestions = DbRepository.shared.findSuggestions(for: text)
        return suggestions.map { word in
            let result = (isCap ? word.prefix(1).uppercased() : word.prefix(1).lowercased()) + word.dropFirst()
            return StandardAutocompleteSuggestion(text: result)
        }
    }
    
    func suggestion(_ text: String, _ subtitle: String? = nil) -> AutocompleteSuggestion {
        StandardAutocompleteSuggestion(text: text, subtitle: subtitle)
    }

    func matchSuggestions() -> [AutocompleteSuggestion] {
        [
            StandardAutocompleteSuggestion(text: match, isUnknown: true),
            StandardAutocompleteSuggestion(text: match, isAutocomplete: true),
            StandardAutocompleteSuggestion(text: match),
        ]
    }
}
