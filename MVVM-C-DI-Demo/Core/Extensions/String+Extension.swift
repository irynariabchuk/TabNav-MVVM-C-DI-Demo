//
//  String+Extension.swift
//  Test
//
//  Created by Iryna Riabchuk on 21.04.2025.
//

import Foundation

extension String {
    
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    func localizeWithFormat(arguments: CVarArg...) -> String {
        return String(format: self.localized, arguments: arguments)
    }
}
