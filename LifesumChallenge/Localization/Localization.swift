//
//  Localization.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 10/07/2022.
//

import Foundation
struct Localization {
    
    enum LocalizationKey: String {
        
        case errorMessageGeneric = "error_message_generic"
    }
    
    static func string(for key: LocalizationKey) -> String {
        NSLocalizedString(key.rawValue, comment: "")
    }
}
