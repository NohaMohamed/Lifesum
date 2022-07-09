//
//  NutritionalInformationPresenter.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import Foundation
protocol NutritionalInformationToPresenterProtocol {
    func didReceiveInformation(_ info: NutritionalInfoResponseModel.Response)
}
class NutritionalInformationPresenter{
    // MARK: - Dependencies
    
    weak var view: NutritionalInformationPresenterToViewProtocol?
    
    // MARK: - Initializers
    
    init(view: NutritionalInformationPresenterToViewProtocol) {
        self.view = view
    }
}
extension NutritionalInformationPresenter: NutritionalInformationToPresenterProtocol{
    func didReceiveInformation(_ info: NutritionalInfoResponseModel.Response) {
        
    }
}
