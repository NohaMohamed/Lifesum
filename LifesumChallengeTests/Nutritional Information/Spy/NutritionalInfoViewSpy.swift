//
//  Spy.swift
//  LifesumChallengeTests
//
//  Created by Noha Mohamed on 11/07/2022.
//

import Foundation
import UIKit

@testable import LifesumChallenge

class NutritionalInfoViewSpy: NutritionalInfoPresenterToViewProtocol {
    
    
    // MARK: - Dependencies
    
    var interactor: NutritionalInfoViewToInteractorProtocol?
    
    // MARK: - Testing Properties
    
    var nutritionalInfo: NutritionalInfoViewModel?
    var error: (title: String, subtitle: String)?
    var isShowingErrorView = false
    var isShowingLoading = false
    
    // MARK: - Spy Functions

    func showNutritionalInfo(_ model: NutritionalInfoViewModel) {
        self.nutritionalInfo = model
    }
    func showLoading() {
        isShowingLoading = true
    }
    
    func hideLoading() {
        isShowingLoading = false
    }
    
    var retryViewEdgeInsets: UIEdgeInsets?
    
    func showErrorView(title: String, subtitle: String) {
        error = (title: title, subtitle: subtitle)
        isShowingErrorView = true
    }
    
    func hideErrorView() {
        isShowingErrorView = false
    }
}
