//
//  NutritionalStubd.swift
//  LifesumChallengeTests
//
//  Created by Noha Mohamed on 10/07/2022.
//

import Foundation
@testable import LifesumChallenge
class NutritionalStubs {
    static func createNutritionalInfo() -> NutritionalInfoResponseModel.Response {
        return NutritionalInfoResponseModel.Response(calories: 369, carbs: 2, cholesterol: 0.09, fat: 30.64, fiber: 0.0, gramsperserving: 15, pcstext: "Package,  (3 oz)", potassium: 0.091, protein: 21.54, saturatedfat: 19.263, sodium: 1.809, sugar: 0, title: "Roquefort cheese", unsaturatedfat: 9.794)
    }
    static func createNutritionalSuccessData() -> NutritionalInfoResponseModel {
        return NutritionalInfoResponseModel(meta: Meta(code: 200), response: NutritionalStubs.createNutritionalInfo())
    }
    static func createNutritionalFailureData() -> BaseModel {
        return NutritionalInfoResponseModel(meta: Meta(code: 500), response: nil)
    }
}
