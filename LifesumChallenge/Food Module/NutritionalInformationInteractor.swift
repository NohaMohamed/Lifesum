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
    var repository: NutritionalInteractorToRepositoryProtocol
    
    // MARK: - Initializers
    
    init(presenter: NutritionalInformationToPresenterProtocol,
         repository: NutritionalInteractorToRepositoryProtocol) {
        
        self.presenter = presenter
        self.repository = repository
    }
}

extension NutritionalInformationInteractor: NutritionalInformationViewToInteractorProtocol{
    func fetchNutritionalInformation(_ foodId: Int) {
        presenter.showLoading()
        repository.getNutritionalInfo(foodId) {[weak self] result in
            self?.presenter.hideLoading()
            switch result{
            case .success(let nutritional):
                self?.presenter.didReceiveInformation(nutritional.response)
            case .failure(_):
                break
            }
        }
    }
    
    
}
