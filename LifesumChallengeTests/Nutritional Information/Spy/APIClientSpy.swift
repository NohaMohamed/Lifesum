//
//  APIClientSpy.swift
//  LifesumChallengeTests
//
//  Created by Noha Mohamed on 10/07/2022.
//

import Foundation
@testable import LifesumChallenge

class APIClientSpy: APICleintProtocol {
    
    // MARK: - Testing Properties
    
    var isRequestSent = false
    
    // MARK: - Spy Functions
    
    func send<ResponsType>(request: RequestProtocol, compeletion: @escaping (Result<ResponsType, CustomError>) -> Void) where ResponsType : BaseModel {
        
        isRequestSent = true
    }
}
