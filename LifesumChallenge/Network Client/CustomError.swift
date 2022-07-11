//
//  CustomError.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 11/07/2022.
//

import Foundation
enum ErrorCodes : Int {
    case sucess = 200
}
enum CustomError: Error, LocalizedError {
    
    init(error: Error) {
        self = .unknowen(error.asAFError?.localizedDescription)
    }
    
    case canNotDecodeObject
    case generic
    case unknowen(String?)
    
    public var localizedDescription: String {
        switch self {
        case .canNotDecodeObject:
            return Localization.string(for: "")
        case .generic:
            return Localization.string(for: "")
        case .unknowen(let message):
            return message ?? Localization.string(for: "")
        }
    }

}
