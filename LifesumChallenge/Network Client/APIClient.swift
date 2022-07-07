//
//  APIClient.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 07/07/2022.
//

import Foundation
import Alamofire

protocol APICleintProtocol {
    
    func send<ResponsType>(request: RequestProtocol, compeletion: @escaping (Result<ResponsType, Error>) -> Void) where ResponsType: Codable
}

class APICleint {
    
    static let shared = APICleint()
    
    private init() {}
}

extension APICleint: APICleintProtocol {
    
    func send<ResponsType>(request: RequestProtocol, compeletion: @escaping (Result<ResponsType, Error>) -> Void) where ResponsType : Codable {
        Session.default.request(request).validate().responseObject(compeletion: compeletion)
    }
}
