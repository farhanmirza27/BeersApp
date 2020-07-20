//
//  BeersListViewModel.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit
import Kingfisher

// view model
class BeerViewModel  {
    var id : String
    var name : String
    var imageURL : String?
    var description : String
    var isFav : Bool
    var dataManager : DataManagerProtocol?
    
    // intialization
    init(beer : Beer, dataManager : DataManagerProtocol) {
        self.id = beer.id
        self.name  = beer.name
        self.imageURL = beer.labels?.large
        self.dataManager = dataManager
        if let description = beer.description {
            self.description = description
        }
        else {self.description = ""}
        
        // check for favourite and not favourite.
        let filteredArray = dataManager.loadFavouriteBeers().filter { $0 == beer.id}
        if filteredArray.isEmpty {
            self.isFav = false
        }
        else {
            self.isFav = true
        }
    }
}
