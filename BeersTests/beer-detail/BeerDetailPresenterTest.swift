//
//  BeerDetailPresenterTest.swift
//  BeersTests
//
//  Created by Farhan Mirza on 20/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import XCTest
@testable import Beers

// Beer Detail Module Test
class BeerDetailPresenterTest: XCTestCase {
    
    var sut : BeerDetailPresenter?  // system under testing
    var mockedInteractor : MockedInteractor?
    
    
    override func setUp() {
        sut = BeerDetailPresenter()
        mockedInteractor = MockedInteractor()
        
        sut?.interactor = mockedInteractor
    }
    
    override func tearDown() {
        sut = nil
        mockedInteractor  = nil
    }
    
    // test mark as favourite
    func testMarkAsFavourite() {
        sut?.markAsFavourite(beerId: "1xe3")
        XCTAssertTrue(mockedInteractor!.markedAsFavourite)
    }
    
    // test unmark as favourite
    func testUnmarkAsFavourite() {
        sut?.unmarkAsFavourite(beerId: "1xe3")
        XCTAssertTrue(mockedInteractor!.unmarkedAsFavourite)
    }
    
    
    //MARK: MockedInteractor
    class MockedInteractor : PresenterToInteractorBeerDetailProtocol {
        var markedAsFavourite = false
        var unmarkedAsFavourite = false
        
        var presenter: InteractorToPresenterBeerDetailProtocol?
        var apiManager: APIManagerProtocol?  
        var dataManager: DataManagerProtocol?
        
        func markAsFavourite(beerId: String) {
            markedAsFavourite = true
        }
        
        func unmarkAsFavourite(beerId: String) {
            unmarkedAsFavourite = true
        }
    }
    
}
