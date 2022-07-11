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
    
    var sut: NutritionalInfoInteractor!
    var repository: NutritionalRepositoryMock!
    var presenter: NutritionalInfoPresenterSpy!
    var apiClientSpy: APIClientSpy!
    
    // MARK: - Life Cycle Functions
    
    override func setUp() {
        super.setUp()
        
        apiClientSpy = APIClientSpy()
        repository = NutritionalRepositoryMock(apiClient: apiClientSpy)
        presenter = NutritionalInfoPresenterSpy()
        sut = NutritionalInfoInteractor(presenter: presenter, repository: repository)
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
        sut = NutritionalInfoInteractor(presenter: presenter,
                                   repository: repository)
        // Then
        XCTAssertNotNil(sut.presenter)
        XCTAssertNotNil(sut.repository)
    }
    
    func test_fetchNutritionalInfo_Success() {
        // when
        sut.fetchNutritionalInfo(1)
        repository.simulateGettingNonEmptySuccessRespons()
        // then
        XCTAssertNotNil(presenter.nutritionalInfo)
    }

    func test_fetchAllNutritionalInfo_failure() {
//        // when
        sut.fetchNutritionalInfo(1)
        repository.simulateGettingErrorResponse()
        // then
        XCTAssertNotNil(presenter.error)
    }
}
