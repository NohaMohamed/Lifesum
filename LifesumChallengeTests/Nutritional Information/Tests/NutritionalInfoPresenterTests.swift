//
//  LifesumChallengeTests.swift
//  LifesumChallengeTests
//
//  Created by Noha Mohamed on 06/07/2022.
//

import XCTest
@testable import LifesumChallenge

class NutritionalInfoPresenterTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: NutritionalInfoPresenter!
    var view: NutritionalInfoViewSpy!

    // MARK: - Life Cycle Functions
    
    override func setUp() {
        super.setUp()
        
        view = NutritionalInfoViewSpy()
        sut = NutritionalInfoPresenter(view: view)
    }
    
    override func tearDown() {
        super.tearDown()
        
        view = nil
        sut = nil
    }
    
    func test_init() {
        // Given
        view = NutritionalInfoViewSpy()
        // When
        sut = NutritionalInfoPresenter(view: view)
        // Then
        XCTAssertNotNil(sut.view)
    }
    
    func test_map() {
        // Given
        let nutritionalInfo = NutritionalStubs.createNutritionalInfo()
        // When
        let nutritionalInfoViewModel = sut.map(nutritionalInfo)
        // Then
        XCTAssertEqual(nutritionalInfo.title, nutritionalInfoViewModel.name)
        XCTAssertEqual(nutritionalInfo.calories, nutritionalInfoViewModel.calories)
        XCTAssertEqual(nutritionalInfo.carbs, nutritionalInfoViewModel.carbs.floatValueWithoutPercentage)
        XCTAssertEqual(nutritionalInfo.fat, nutritionalInfoViewModel.fat.floatValueWithoutPercentage)
        XCTAssertEqual(nutritionalInfo.protein, nutritionalInfoViewModel.protein.floatValueWithoutPercentage)
    }
}
