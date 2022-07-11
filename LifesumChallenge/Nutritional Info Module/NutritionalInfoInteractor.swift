//
//  NutritionalInfonInteractor.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import Foundation
protocol NutritionalInfoViewToInteractorProtocol {
    func fetchNutritionalInfo(_ foodId: Int)
}

class NutritionalInfoInteractor {
    // MARK: - Dependencies
    
    var presenter: NutritionalInfoToPresenterProtocol
    var repository: NutritionalInteractorToRepositoryProtocol
    
    // MARK: - Initializers
    
    init(presenter: NutritionalInfoToPresenterProtocol,
         repository: NutritionalInteractorToRepositoryProtocol) {
        
        self.presenter = presenter
        self.repository = repository
    }
}

extension NutritionalInfoInteractor: NutritionalInfoViewToInteractorProtocol{
    func fetchNutritionalInfo(_ foodId: Int) {
        presenter.showLoading()
        repository.getNutritionalInfo(foodId) {[weak self] result in
            self?.presenter.hideLoading()
            switch result{
            case .success(let nutritional):
                guard let info = nutritional.response else {
                    self?.presenter.didReceiveError(CustomError.generic)
                    return
                }
                self?.presenter.didReceiveInfo(info)
            case .failure(let error):
                self?.presenter.didReceiveError(error)
            }
        }
    }
    
    
}
