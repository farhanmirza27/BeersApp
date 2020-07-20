//
//  BeerDetailProtocols.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

// Beer Detail Module Protocols

// View to Presenter
protocol ViewToPresenterBeerDetailProtocol : class {
    var view : PresenterToViewBeerDetailProtocol? {get set}
    var interactor : PresenterToInteractorBeerDetailProtocol? {get set}
    var router : PresenterToRouterBeerDetailProtocol? {get set}
    
    func markAsFavourite(beerId : String)
    func unmarkAsFavourite(beerId : String)
}

// Presenter to View
protocol PresenterToViewBeerDetailProtocol : class {
    // can be extended
}

// Presenter to Interactor
protocol PresenterToInteractorBeerDetailProtocol : class {
    var presenter : InteractorToPresenterBeerDetailProtocol? {get set}
    var apiManager : APIManagerProtocol? {get set}
    var dataManager : DataManagerProtocol? {get set}
    
    func markAsFavourite(beerId : String)
    func unmarkAsFavourite(beerId : String)
}

// Interactor to presenter
protocol InteractorToPresenterBeerDetailProtocol : class {
    // can be extended
}

// Presenter to router
protocol PresenterToRouterBeerDetailProtocol : class {
    static func createModule(beer : BeerViewModel) -> BeerDetailViewController
}

// Detail View delegate.
protocol BeerDetailViewDelegate  {
    func refreshListView()
}

