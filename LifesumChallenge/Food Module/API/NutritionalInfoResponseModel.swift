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
    
    enum CodingKeys: String, CodingKey {
        case meta
        case response
    }
    
    struct Response : Codable {
        
        let calories : Int?
        let carbs : Float?
        let cholesterol : Float?
        let fat : Float?
        let fiber : Float?
        let gramsperserving : Float?
        let pcstext : String?
        let potassium : Float?
        let protein : Float?
        let saturatedfat : Float?
        let sodium : Float?
        let sugar : Float?
        let title : String?
        let unsaturatedfat : Float?
        
        
        enum CodingKeys: String, CodingKey {
            case calories = "calories"
            case carbs = "carbs"
            case cholesterol = "cholesterol"
            case fat = "fat"
            case fiber = "fiber"
            case gramsperserving = "gramsperserving"
            case pcstext = "pcstext"
            case potassium = "potassium"
            case protein = "protein"
            case saturatedfat = "saturatedfat"
            case sodium = "sodium"
            case sugar = "sugar"
            case title = "title"
            case unsaturatedfat = "unsaturatedfat"
        }
    }
}

struct Meta : Codable {
    
    let code : Int?
    enum CodingKeys: String, CodingKey {
        case code = "code"
    }
    
}
