//
//  NutritionalInfoPresenter.swift
//  LifesumChallenge
//
//  Created by Noha Mohamed on 09/07/2022.
//

import Foundation
protocol NutritionalInfoToPresenterProtocol {
    func didReceiveInfo(_ info: NutritionalInfoResponseModel.Response)
    func didReceiveError(_ error: CustomError)
    func showLoading()
    func hideLoading()
}
class NutritionalInfoPresenter{
    // MARK: - Dependencies
    
    weak var view: NutritionalInfoPresenterToViewProtocol?
    
    // MARK: - Initializers
    
    init(view: NutritionalInfoPresenterToViewProtocol) {
        self.view = view
    }
    func map(_ apiResponse: NutritionalInfoResponseModel.Response) -> NutritionalInfoViewModel {
        return NutritionalInfoViewModel(name: apiResponse.title, calories: apiResponse.calories, carbs: apiResponse.carbs.stringValueWithPercentage , protein: apiResponse.protein.stringValueWithPercentage, fat: apiResponse.fat.stringValueWithPercentage)
    }
}
extension NutritionalInfoPresenter: NutritionalInfoToPresenterProtocol{
    func didReceiveError(_ error: CustomError) {
        view?.showErrorView(title: Localization.string(for: "error_title"), subtitle: error.localizedDescription)
    }
    
    func showLoading() {
        view?.showLoading()
    }
    
    func hideLoading() {
        self.view?.hideLoading()
    }
    
    func didReceiveInfo(_ info: NutritionalInfoResponseModel.Response) {
        let viewModel = map(info)
        view?.showNutritionalInfo(viewModel)
    }
    
}
