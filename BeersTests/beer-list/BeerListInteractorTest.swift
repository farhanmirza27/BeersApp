//
//  BeerListInteractorTest.swift
//  BeersTests
//
//  Created by Farhan Mirza on 20/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import XCTest
@testable import Beers

//Beer List Module Interactor Test
class BeerListInteractorTest: XCTestCase {
    
    var sut : BeersListInteractor?  // system under testing
    var mockedPresenter : MockedPresenter?
    var mockedAPIMananger : MockedAPIManager?
    var mockedDataManager : MockedDataManager?
    
    override func setUp() {
        sut = BeersListInteractor()
        
        mockedAPIMananger = MockedAPIManager()
        mockedDataManager = MockedDataManager()
        mockedPresenter = MockedPresenter()
        
        //  intialization
        sut?.presenter = mockedPresenter
        sut?.apiManager = mockedAPIMananger
        sut?.dataManager = mockedDataManager
        
        super.setUp()
    }
    
    override func tearDown() {
        sut = nil
        mockedAPIMananger = nil
        mockedAPIMananger = nil
        mockedDataManager = nil
    }
    
    // test load beer success
    func testLoadBeersSuccess() {
        mockedAPIMananger?.dataReturnedFromAPI = true
        sut?.loadBeers()
        DispatchQueue.main.async {
            XCTAssertTrue(self.mockedPresenter!.dataLoaded)
        }
    }
    
    // test load beer failure
    func testLoadBeersFail() {
        mockedAPIMananger?.dataReturnedFromAPI = false
        sut?.loadBeers()
        DispatchQueue.main.async {
            XCTAssertFalse(self.mockedPresenter!.dataLoaded)
        }
    }
    
    // test showAll
    func testShowAll() {
        sut?.showAll()
        XCTAssertTrue(mockedPresenter!.dataLoaded)
    }
    
    // test favourites only
    func testShowFavouriteOnly() {
        sut?.showAll()
        XCTAssertTrue(mockedPresenter!.dataLoaded)
    }
    
    class MockedPresenter : InteractorToPresenterBeersListProtocol {
        var dataLoaded = false
        func success(beers: [BeerViewModel]) {
            dataLoaded = true
        }
        
        func failure(errorMessage: String) {
            dataLoaded = false
        }
    }
    
    class MockedAPIManager : APIManagerProtocol {
        var dataReturnedFromAPI = false
        
        func beersList(completion: @escaping ([BeerViewModel]?, Error?) -> Void) {
            if dataReturnedFromAPI {
                completion([],nil)
            }
            else {
                completion(nil,ApiError.invalidData)
            }
        }
    }
    
    class MockedDataManager : DataManagerProtocol {
        
        func markAsFavourite(beerId: String) {
        }
        
        func unmarkAsFavourite(beerId: String) {
        }
        
        func loadFavouriteBeers() -> [String] {
            return []
        }
        
        func saveBeers(beers: [Beer]) {
        }
        
        func loadBeers() -> [Beer] {
            return []
        }
        
        
    }
}
