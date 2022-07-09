//
//  FoodRequest.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 07/07/2022.
//

import Foundation
enum FoodRequest: RequestProtocol {
    case getNutritionalInfo(_ foodId: Int)
    
    var endPoint: String{
        switch self {
        case .getNutritionalInfo:
            return "v2/foodipedia/codetest"
        }
    }
    
    var method: HTTPMethod {
        switch self{
        case .getNutritionalInfo:
            return .get
        }
    }
    var headers: HTTPHeaders? {
        nil
    }
    var parameters: Parameters? {
        switch self{
        case .getNutritionalInfo(let foodId):
            return [
                Keys.foodID : foodId
            ]
        }
    }
    struct Keys {
        static let foodID = "foodid"
    }
}
