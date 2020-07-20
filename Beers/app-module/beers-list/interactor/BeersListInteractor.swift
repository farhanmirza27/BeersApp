//
//  BeersListInteractor.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

class BeersListInteractor :  PresenterToInteractorBeersListProtocol  {
    
    var presenter: InteractorToPresenterBeersListProtocol?
    var apiManager: APIManagerProtocol?
    var dataManager : DataManagerProtocol?
    
    // load beers by requesting api-manager
    func loadBeers() {
        apiManager?.beersList(completion: { (beers,error)  in
            DispatchQueue.main.async {
                guard let beers = beers else {
                    guard let error = error else {return}
                    self.presenter?.failure(errorMessage: error.localizedDescription)
                    return
                }
                self.presenter?.success(beers: beers)
            }
        })
    }
    
    // show all beers by requesting local data manager
    func showAll() {
        self.presenter?.success(beers: getBeersList())
    }
    
    // show favourite only by requesting local data manager
    func showFavouriteOnly() {
        self.presenter?.success(beers: getBeersList(favouriteOnly: true))
    }
    
    // private func to fetch beers list from local db... 
    private func getBeersList(favouriteOnly : Bool = false) -> [BeerViewModel] {
        if let beers = dataManager?.loadBeers() {
            if !favouriteOnly {
                return beers.compactMap({BeerViewModel(beer : $0, dataManager: DataManager())})
            }
            else {
                // filter favourite beers
                var favouriteBeers = [Beer]()
                for beer in beers {
                    if  dataManager?.loadFavouriteBeers().contains(beer.id) ?? false {
                        favouriteBeers.append(beer)
                    }
                }
                return favouriteBeers.compactMap({BeerViewModel(beer : $0, dataManager: DataManager())})
            }
        }
        else {
            return []
        }
    }
}
