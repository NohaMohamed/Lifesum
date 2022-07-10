//
//  NutritionalInformationInteractor.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import Foundation
protocol NutritionalInformationViewToInteractorProtocol {
    func fetchNutritionalInformation(_ foodId: Int)
}

class NutritionalInformationInteractor {
    // MARK: - Dependencies
    
    var presenter: NutritionalInformationToPresenterProtocol
    var repository: FoodInteractorToRepositoryProtocol
    
    // MARK: - Initializers
    
    init(presenter: NutritionalInformationToPresenterProtocol,
         repository: FoodInteractorToRepositoryProtocol) {
        
        self.presenter = presenter
        self.repository = repository
    }
}

extension NutritionalInformationInteractor: NutritionalInformationViewToInteractorProtocol{
    func fetchNutritionalInformation(_ foodId: Int) {
        repository.getNutritionalInfo(foodId) { result in
            switch result{
            case .success(let nutritional):
                print(nutritional)
                break
//                presenter.didReceiveInformation(nutritional.response)
            case .failure(_):
                break
            }
        }
    }
    
    
}
