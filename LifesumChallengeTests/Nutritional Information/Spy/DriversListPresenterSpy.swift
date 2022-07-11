//
//  spy.swift
//  LifesumChallengeTests
//
//  Created by Noha Mohamed on 11/07/2022.
//

import Foundation
@testable import LifesumChallenge

class NutritionalInfoPresenterSpy: NutritionalInfoToPresenterProtocol {
    
    
    // MARK: - Testing Properties
    
    var nutritionalInfo: NutritionalInfoResponseModel.Response?
    var error: Error?
    var isShowingLoading = false
    
    // MARK: - Dependencies
    
    var view: NutritionalInfoPresenterToViewProtocol?
    
//    // MARK: - Spy Functions
//

    func didReceiveError(_ error: CustomError) {
        self.error = error
    }
    func didReceiveInfo(_ info: NutritionalInfoResponseModel.Response) {
        nutritionalInfo = info
    }
    func showLoading() {
        isShowingLoading = true
    }
    
    func hideLoading() {
        isShowingLoading = false
    }
    
}
