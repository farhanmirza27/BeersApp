//
//  BeerDetailPresenter.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


class BeerDetailPresenter : ViewToPresenterBeerDetailProtocol {
    weak var view: PresenterToViewBeerDetailProtocol?
    var interactor: PresenterToInteractorBeerDetailProtocol?
    var router: PresenterToRouterBeerDetailProtocol?
    
    // mark as favourite
    func markAsFavourite(beerId : String) {
        interactor?.markAsFavourite(beerId: beerId)
    }
    
    // unmark as favourite
    func unmarkAsFavourite(beerId : String) {
        interactor?.unmarkAsFavourite(beerId: beerId)
    }
}

extension BeerDetailPresenter : InteractorToPresenterBeerDetailProtocol {
    // can be extended
}
