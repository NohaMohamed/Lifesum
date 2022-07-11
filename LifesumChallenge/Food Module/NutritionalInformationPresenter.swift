//
//  NutritionalInformationPresenter.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import Foundation
protocol NutritionalInformationToPresenterProtocol {
    func didReceiveInformation(_ info: NutritionalInfoResponseModel.Response)
    func didReceiveError(_ error: CustomError)
    func showLoading()
    func hideLoading()
}
class NutritionalInformationPresenter{
    // MARK: - Dependencies
    
    weak var view: NutritionalInformationPresenterToViewProtocol?
    
    // MARK: - Initializers
    
    init(view: NutritionalInformationPresenterToViewProtocol) {
        self.view = view
    }
    func map(_ apiResponse: NutritionalInfoResponseModel.Response) -> NutritionalInfoViewModel {
        return NutritionalInfoViewModel(name: apiResponse.title, calories: apiResponse.calories, carbs: "\(apiResponse.carbs) %" , protein: "\(apiResponse.protein) %", fat: "\(apiResponse.fat) %")
    }
}
extension NutritionalInformationPresenter: NutritionalInformationToPresenterProtocol{
    func didReceiveError(_ error: CustomError) {
        view?.showErrorView(title: "error_title".localizedLowercase, subtitle: error.localizedDescription)
    }
    
    func showLoading() {
        view?.showLoading()
    }
    
    func hideLoading() {
        self.view?.hideLoading()
    }
    
    func didReceiveInformation(_ info: NutritionalInfoResponseModel.Response) {
        let viewModel = map(info)
        view?.showNutritionalInformation(viewModel)
    }
    
}
