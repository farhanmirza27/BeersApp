//
//  BeerDetailInteractor.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


class BeerDetailInteractor : PresenterToInteractorBeerDetailProtocol {
    
    var presenter: InteractorToPresenterBeerDetailProtocol?
    var apiManager: APIManagerProtocol?
    var dataManager: DataManagerProtocol?
    
    // mark as favourite by saving beer id in lcoal db
    func markAsFavourite(beerId : String) {
        dataManager?.markAsFavourite(beerId: beerId)
    }
    
    // unmark as favourite by removing saved beer id from local db.
    func unmarkAsFavourite(beerId : String) {
        dataManager?.unmarkAsFavourite(beerId: beerId)
    }
}
