//
//  BeersListProtocols.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

// Beer List Module Protocols

// View to Presenter
protocol ViewToPresenterBeersListProtocol : class {
    var view : PresenterToViewBeersListProtocol? {get set}
    var interactor : PresenterToInteractorBeersListProtocol? {get set}
    var router : PresenterToRouterBeersListProtocol? {get set}
    
    func loadBeers()
    func showDetails(beer : BeerViewModel, from : BeersListViewController)
    func showAll()
    func showFavouriteOnly()
}

// Presenter to View
protocol PresenterToViewBeersListProtocol : class {
    func success(beers : [BeerViewModel])
    func failure(errorMessage : String)
}

// Presenter to Interactor
protocol PresenterToInteractorBeersListProtocol : class {
    var presenter : InteractorToPresenterBeersListProtocol? {get set}
    var apiManager : APIManagerProtocol? {get set}
    var dataManager : DataManagerProtocol? {get set}
    
    func loadBeers()
    func showAll()
    func showFavouriteOnly()
}

// Interactor to Presenter
protocol InteractorToPresenterBeersListProtocol : class {
    func success(beers : [BeerViewModel])
    func failure(errorMessage : String)
}

// Presenter to Router
protocol PresenterToRouterBeersListProtocol : class {
    static func createModule() -> BeersListViewController
    func showDetail(beer : BeerViewModel, from : BeersListViewController)
}
