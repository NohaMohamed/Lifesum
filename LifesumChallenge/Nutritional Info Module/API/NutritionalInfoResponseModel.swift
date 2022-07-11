//
//  NutritionalFoodModel.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 07/07/2022.
//

import Foundation
protocol BaseModel : Codable {
    var meta: Meta{get}
}
struct NutritionalInfoResponseModel : BaseModel {
    
    var meta: Meta
    let response : Response?
    
    struct Response : Codable {
        
        let calories : Int
        let carbs : Float
        let cholesterol : Float
        let fat : Float
        let fiber : Float
        let gramsperserving : Float
        let pcstext : String
        let potassium : Float
        let protein : Float
        let saturatedfat : Float
        let sodium : Float
        let sugar : Float
        let title : String
        let unsaturatedfat : Float
    }
    
}

struct Meta : Codable {
    let code : Int
}
