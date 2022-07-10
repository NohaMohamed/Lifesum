//
//  Localization.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 10/07/2022.
//

import Foundation
struct Localization {
    static func string(for key: String) -> String {
        NSLocalizedString(key, comment: "")
    }
}
