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
    func map(_ apiResponse: NutritionalInfoResponseModel.Response) -> NutritionalInfoViewModel {
        return NutritionalInfoViewModel(Name: apiResponse.title ?? "", foodCalories: apiResponse.calories ?? 0, carbs: "\(apiResponse.carbs ?? 0) %" , protein: "\(apiResponse.protein ?? 0) %", fat: "\(apiResponse.fat ?? 0) %")
    }
}
extension NutritionalInformationPresenter: NutritionalInformationToPresenterProtocol{
    func didReceiveInformation(_ info: NutritionalInfoResponseModel.Response) {
        let viewModel = map(info)
        view?.showNutritionalInformation(viewModel)
    }
}
