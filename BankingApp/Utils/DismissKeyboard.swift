//
//  DismissKeyboard.swift
//  BankingApp
//
//  Created by Udita Chakraborty on 19/08/24.
//

import UIKit

extension UIApplication {
    func endEditing() {
        if let windowScene = connectedScenes.first(where: { $0 is UIWindowScene }) as? UIWindowScene {
                windowScene.windows.forEach { $0.endEditing(true) }
            }
        }
}
