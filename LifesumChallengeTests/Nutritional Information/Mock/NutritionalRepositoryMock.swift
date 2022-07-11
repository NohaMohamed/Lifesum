//
//  Mock.swift
//  LifesumChallengeTests
//
//  Created by Noha Mohamed on 10/07/2022.
//

import Foundation
@testable import LifesumChallenge

class NutritionalRepositoryMock: NutritionalInteractorToRepositoryProtocol {

    // MARK: - Dependencies
    
    let apiClient: APICleintProtocol
    
    init(apiClient: APIClientSpy) {
        self.apiClient = apiClient
    }
    
    // MARK: - Testing Properties
    
    var compeletion: ((Result<NutritionalInfoResponseModel, CustomError>) -> Void)?
    
    // MARK: - Mock Behaviour
    
    func successResponsStub() -> NutritionalInfoResponseModel {
        NutritionalStubs.createNutritionalSuccessData()
    }
    func simulateGettingNonEmptySuccessRespons() {
        compeletion?(Result.success(successResponsStub()))
    }
    func simulateGettingErrorResponse() {
        compeletion?(Result.failure(CustomError.canNotDecodeObject))
    }
    
    // MARK: - Mock Function
    
    func getNutritionalInfo(_ foodId: Int, compeletion: @escaping (Result<NutritionalInfoResponseModel, CustomError>) -> Void) {
        self.compeletion = compeletion
    }
}
