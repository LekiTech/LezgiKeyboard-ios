//
//  DemoActionHandler.swift
//  LezgiChal
//
//  Created by Kamran Tadzjibov on 25/11/2022.
//

import KeyboardKit
import UIKit

class DemoKeyboardActionProvider: BaseCalloutActionProvider {
    
    override func calloutActionString(for char: String) -> String {
        var returnString: String = "";
        switch char.lowercased() {
        case "у":
            returnString = char.isLowercased ? "ю" : "Ю"
        case "ш":
            returnString = char.isLowercased ? "щ" : "Щ"
            //ь ы Ы
        case "ь":
            returnString = char.isLowercased ? "ы" : "Ы"
        default:
            returnString = ""
        }
        return returnString;
    }
////    public init(inputViewController: KeyboardInputViewController) {
////        super.init(inputViewController: inputViewController)
////    }
//
//
//    // MARK: - Overrides
////
////    override func action(for gesture: KeyboardGesture, on action: KeyboardAction) -> KeyboardAction.GestureAction? {
////        let standard = super.action(for: gesture, on: action)
////        switch gesture {
////        case .longPress: return longPressAction(for: action) ?? standard
////        case .tap: return tapAction(for: action) ?? standard
////        default: return standard
////        }
////    }
//
////    override func handle(_ gesture: KeyboardGesture, on action: KeyboardAction) {
////        // Customize the action handling if needed
////        super.handle(gesture, on: action)
////    }
//
//
//    // MARK: - Custom actions
//
//    func longPressAction(for action: KeyboardAction) -> KeyboardAction.GestureAction? {
//        switch action {
//        case .image(_, _, let imageName): return { [weak self] _ in self?.saveImage(named: imageName) }
//        default: return nil
//        }
//    }
//
////    func tapAction(for action: KeyboardAction) -> KeyboardAction.GestureAction? {
////        switch action {
////        case .image(_, _, let imageName): return { [weak self] _ in self?.copyImage(named: imageName) }
////        default: return nil
////        }
////    }
//
//
//    // MARK: - Functions
//
//    /**
//     Override this function to implement a way to alert text
//     messages in the keyboard extension. You can't use logic
//     that you use in real apps, e.g. `UIAlertController`.
//     */
////    func alert(_ message: String) {}
////
////    func copyImage(_ image: UIImage) {
////        guard keyboardContext.hasFullAccess else { return alert("You must enable full access to copy images.") }
////        guard image.copyToPasteboard() else { return alert("The image could not be copied.") }
////        alert("Copied to pasteboard!")
////    }
////
////    func copyImage(named imageName: String) {
////        guard let image = UIImage(named: imageName) else { return }
////        copyImage(image)
////    }
////
////    func saveImage(_ image: UIImage) {
////        guard keyboardContext.hasFullAccess else { return alert("You must enable full access to save images.") }
////        image.saveToPhotos(completion: handleImageDidSave)
////        alert("Saved to photos!")
////    }
////
////    func saveImage(named imageName: String) {
////        guard let image = UIImage(named: imageName) else { return }
////        saveImage(image)
////    }
}
