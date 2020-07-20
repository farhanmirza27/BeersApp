//
//  BeersListPresenter.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

class BeersListPresenter : ViewToPresenterBeersListProtocol  {
    
    weak var view: PresenterToViewBeersListProtocol?
    var interactor: PresenterToInteractorBeersListProtocol?
    var router: PresenterToRouterBeersListProtocol?
    
    // load all beers on view did load
    func loadBeers() {
        interactor?.loadBeers()
    }
    
    // show all beers
    func showAll() {
        interactor?.showAll()
    }
    
    // show favourite only
    func showFavouriteOnly() {
        interactor?.showFavouriteOnly()
    }
    
    // navigate to detail view
    func showDetails(beer: BeerViewModel, from : BeersListViewController) {
        router?.showDetail(beer: beer, from: from)
    }
}

//MARK: InteractorToPresenterBeersListProtocol
extension BeersListPresenter : InteractorToPresenterBeersListProtocol {
    // success from interactor
    func success(beers: [BeerViewModel]) {
        view?.success(beers: beers)
    }
    // failure from interactor
    func failure(errorMessage: String) {
        view?.failure(errorMessage: errorMessage)
    }
}
