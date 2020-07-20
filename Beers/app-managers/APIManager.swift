//
//  APIManager.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

// API manager protocol
protocol APIManagerProtocol {
    func beersList(completion : @escaping ([BeerViewModel]?,Error?) -> Void)
}

// API manager class - working as middle layer
class APIManager : APIManagerProtocol {
    
    func beersList(completion: @escaping ([BeerViewModel]?, Error?) -> Void) {
        // beers list from api call
        ApiClient().loadBeers { result in
            switch result {
                // success
            // saving data to local storage.
            case .success(let res):
                DataManager().saveBeers(beers: res.data)
                // transforming to beer view model
                let beers = res.data.compactMap({BeerViewModel(beer : $0, dataManager: DataManager())})
                completion(beers, nil)
                
            // failure..
            case .failure(let error):
                completion(nil,error)
            }
        }
    }
}
