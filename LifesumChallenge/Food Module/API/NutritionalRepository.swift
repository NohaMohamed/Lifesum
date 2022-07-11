//
//  FoodRepository.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 07/07/2022.
//

import Foundation
protocol NutritionalInteractorToRepositoryProtocol {
    var apiClient: APICleintProtocol { get }
    func getNutritionalInfo(_ foodId: Int, compeletion: @escaping (Result<NutritionalInfoResponseModel, Error>) -> Void)
}
final class FoodRepository {
    
    // MARK: - Dependencies
    
    var apiClient: APICleintProtocol{
        return APICleint.shared
    }
}

// MARK: - Extensions

extension FoodRepository: NutritionalInteractorToRepositoryProtocol {
    
    // MARK: - Functions
    
    func getNutritionalInfo(_ foodId: Int, compeletion: @escaping (Result<NutritionalInfoResponseModel, Error>) -> Void) {
        
        let request = NutritionalRequest.getNutritionalInfo(foodId)
        
        apiClient.send(request: request,compeletion: compeletion)
    }
}
