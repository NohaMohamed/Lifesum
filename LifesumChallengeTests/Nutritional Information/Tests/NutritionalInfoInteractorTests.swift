//
//  test.swift
//  LifesumChallengeTests
//
//  Created by Noha Mohamed on 11/07/2022.
//

import XCTest
@testable import LifesumChallenge
class NutritionalInfoInteractorTests: XCTestCase {
    
    // MARK: - Properties
    
    var sut: NutritionalInformationInteractor!
    var repository: NutritionalRepositoryMock!
    var presenter: NutritionalInfoPresenterSpy!
    var apiClientSpy: APIClientSpy!
    
    // MARK: - Life Cycle Functions
    
    override func setUp() {
        super.setUp()
        
        apiClientSpy = APIClientSpy()
        repository = NutritionalRepositoryMock(apiClient: apiClientSpy)
        presenter = NutritionalInfoPresenterSpy()
        sut = NutritionalInformationInteractor(presenter: presenter, repository: repository)
    }
    
    override func tearDown() {
        super.tearDown()
        
        repository = nil
        presenter = nil
        apiClientSpy = nil
        sut = nil
    }
    
    // MARK: - Tests
    
    func test_init() {
        // Given
        repository = NutritionalRepositoryMock(apiClient: APIClientSpy())
        presenter = NutritionalInfoPresenterSpy()
        
        // When
        sut = NutritionalInformationInteractor(presenter: presenter,
                                   repository: repository)
        // Then
        XCTAssertNotNil(sut.presenter)
        XCTAssertNotNil(sut.repository)
    }
    
    func test_fetchNutritionalInformation_nonEmptySuccess() {
        // when
        sut.fetchNutritionalInformation(1)
        repository.simulateGettingNonEmptySuccessRespons()
        // then
        XCTAssertNotNil(presenter.nutritionalInfo)
    }
    
//    func test_fetchAllDriversInHambureg_emptySuccess() {
//        // when
//        sut.fetchAllDriversInHambureg()
//        repository.simulateGettingEmptySuccessRespons()
//        // then
//        XCTAssertTrue(presenter.drivers?.isEmpty ?? false)
//    }
//    
    func test_fetchAllDriversInHambureg_failure() {
//        // when
//        sut.fetchAllDriversInHambureg()
//        repository.simulateGettingErrorRespons()
//        // then
//        XCTAssertNotNil(presenter.error)
    }
//    
//    func test_fetchAllDriversInHambureg_shouldShowLoadingBeforResponse() {
//        // when
//        sut.fetchAllDriversInHambureg()
//        // then
//        XCTAssertTrue(presenter.isShowingLoading)
//    }
//    
//    func test_fetchAllDriversInHambureg_shouldHideLoadingAfterSuccessResponse() {
//        // when
//        sut.fetchAllDriversInHambureg()
//        repository.simulateGettingEmptySuccessRespons()
//        // then
//        XCTAssertFalse(presenter.isShowingLoading)
//    }
//    
//    func test_fetchAllDriversInHambureg_shouldHideLoadingAfterFailureResponse() {
//        // when
//        sut.fetchAllDriversInHambureg()
//        repository.simulateGettingErrorRespons()
//        // then
//        XCTAssertFalse(presenter.isShowingLoading)
//    }
//    
//    func test_fetchAllDriversInHambureg_shouldTriggerApiClient() {
//        // when
//        sut.fetchAllDriversInHambureg()
//        // then
//        XCTAssertNotNil(apiClientSpy.isRequestSent)
//    }
    
}
