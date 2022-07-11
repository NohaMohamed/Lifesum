//
//  spy.swift
//  LifesumChallengeTests
//
//  Created by Noha Mohamed on 11/07/2022.
//

import Foundation
@testable import LifesumChallenge

class NutritionalInfoPresenterSpy: NutritionalInformationToPresenterProtocol {
    
    
    // MARK: - Testing Properties
    
    var nutritionalInfo: NutritionalInfoResponseModel.Response?
    var error: Error?
    var isShowingLoading = false
    
    // MARK: - Dependencies
    
    var view: NutritionalInformationPresenterToViewProtocol?
    
//    // MARK: - Spy Functions
//
//    func didReceiveDrivers(_ drivers: [Drivers.Driver]) {
//        self.drivers = drivers
//    }
//
//    func didReceiveError(_ error: CustomNetworkError) {
//        self.error = error
//    }
    func didReceiveInformation(_ info: NutritionalInfoResponseModel.Response) {
        nutritionalInfo = info
    }
    func showLoading() {
        isShowingLoading = true
    }
    
    func hideLoading() {
        isShowingLoading = false
    }
    
}
