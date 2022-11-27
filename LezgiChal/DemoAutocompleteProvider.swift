//
//  AutocompleteProvide.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 25/11/2022.
//

import Foundation
import KeyboardKit

class DemoAutocompleteProvider: AutocompleteProvider {

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
        guard text.count > 0 else { return completion(.success([])) }
        if text == match {
            completion(.success(matchSuggestions()))
        } else {
            completion(.success(fakeSuggestions(for: text)))
        }
    }
}

private extension DemoAutocompleteProvider {
    
    func fakeSuggestions(for text: String) -> [AutocompleteSuggestion] {
        let suggestions = DbRepository.shared.findSuggestions(for: text)
        return suggestions.map { word in
            StandardAutocompleteSuggestion(text: word)
        }
    }
    
    func fakeSuggestion(_ text: String, _ subtitle: String? = nil) -> AutocompleteSuggestion {
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
