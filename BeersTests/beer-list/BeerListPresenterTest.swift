//
//  BeerListPresenterTest.swift
//  BeersTests
//
//  Created by Farhan Mirza on 20/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import XCTest
@testable import Beers

// Beers List Module Presenter Tests
class BeerListPresenterTest: XCTestCase {
    
    var sut : BeersListPresenter?  // sut -> System under testing...
    var mockedView : MockedView?
    var mockedInteractor : MockedInteractor?
    var mockedRouter  : MockedRouter?
    
    override func setUp() {
        sut = BeersListPresenter()
        mockedView = MockedView()
        mockedInteractor = MockedInteractor()
        mockedRouter = MockedRouter()
        
        // initialization
        mockedInteractor?.presenter = sut
        sut?.view = mockedView
        sut?.interactor = mockedInteractor
        sut?.router = mockedRouter
    }
    
    override func tearDown() {
        sut = nil
        mockedView = nil
        mockedInteractor = nil
        mockedRouter = nil
    }
    
    // load beers success test
    func testLoadBeersSuccess() {
        mockedInteractor?.dataLoadedFromJSONFile = true
        sut?.loadBeers()
        XCTAssertTrue(mockedView!.beersDataLoaded)
    }
    
    // load beers failure test
    func testLoadBeersFailure() {
        mockedInteractor?.dataLoadedFromJSONFile = false
        sut?.loadBeers()
        XCTAssertFalse(mockedView!.beersDataLoaded)
        
    }
    
    // show all beers from local db test
    func testShowAll() {
        mockedInteractor?.dataLoadedFromStorage = true
        sut?.showAll()
        XCTAssertTrue(mockedView!.beersDataLoaded)
    }
    
    // show favourites only test.
    func testShowFavouriteOnly() {
        mockedInteractor?.dataLoadedFromStorage = true
        sut?.showFavouriteOnly()
        XCTAssertTrue(mockedView!.beersDataLoaded)
    }
    
    // show detail view test
    func testShowDetail() {
        mockedRouter?.detailViewDisplayed = true
        sut?.showDetails(beer: BeerViewModel(beer: Beer(id: "", name: "demo ", description: nil, labels: nil)), from: BeersListViewController())
        XCTAssertTrue(mockedRouter!.detailViewDisplayed)
    }
    
    
    
    //MARK: MockedView
    class MockedView : PresenterToViewBeersListProtocol {
        var beersDataLoaded = false
        // success
        func success(beers: [BeerViewModel]) {
            beersDataLoaded = true
        }
        // failure.
        func failure(errorMessage: String) {
            beersDataLoaded = false
        }
    }
    
    //MARK: MockedInteractor
    class MockedInteractor : PresenterToInteractorBeersListProtocol {
        
        var dataLoadedFromJSONFile = false
        var dataLoadedFromStorage  = false
        
        var presenter: InteractorToPresenterBeersListProtocol?
        var apiManager: APIManagerProtocol?
        var dataManager: DataManagerProtocol?
        
        // load beers
        func loadBeers() {
            if dataLoadedFromJSONFile {
                presenter?.success(beers: [])
            }
            else {
                presenter?.failure(errorMessage: "")
            }
        }
        
        // show all
        func showAll() {
            if dataLoadedFromStorage {
                presenter?.success(beers: [])
            }
        }
        
        // show favourite
        func showFavouriteOnly() {
            if dataLoadedFromStorage {
                presenter?.success(beers: [])
            }
        }
    }
    
    
    class MockedRouter : PresenterToRouterBeersListProtocol {
        var detailViewDisplayed = false
        
        static func createModule() -> BeersListViewController {
            return BeersListViewController()
        }
        
        func showDetail(beer: BeerViewModel, from: BeersListViewController) {
            detailViewDisplayed  = true
        }
    }
    
}
