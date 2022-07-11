//
//  StringExtension.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 11/07/2022.
//

import Foundation
extension String {
    var floatValueWithoutPercentage: Float? {
        get {
            return Float(self.replacingOccurrences(of: " %", with: ""))
        }
    }
}

