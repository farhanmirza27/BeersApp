//
//  DataManager.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation
import Disk

// local data manager protocols
protocol DataManagerProtocol {
    func markAsFavourite(beerId : String)
    func unmarkAsFavourite(beerId : String)
    func loadFavouriteBeers() -> [String]
    func saveBeers(beers : [Beer])
    func loadBeers() -> [Beer]
}

// local data manager class
class DataManager : DataManagerProtocol {
    
    // mark as favourite by saving beer id in local db..
    func markAsFavourite(beerId : String) {
        var beers  = loadFavouriteBeers()
        beers.append(beerId)
        self.saveFavouriteBeers(beers: beers)
    }
    
    // removing beer id from saved ids list in local db
    func unmarkAsFavourite(beerId : String) {
        var beers = loadFavouriteBeers()
        if let index = beers.firstIndex(where: {$0 == beerId}) {
            beers.remove(at: index)
            self.saveFavouriteBeers(beers: beers)
        }
    }
    
    // get all saved beers id for local db
    func loadFavouriteBeers() -> [String] {
        let beers = (try? Disk.retrieve("FavouriteBeers.json", from: .documents, as: [String].self)) ?? []
        return beers
    }
    
    // private func to save favourite ids in local db
    private func saveFavouriteBeers(beers : [String]) {
        do { try Disk.save(beers, to: .documents, as: "FavouriteBeers.json")} catch {}
    }
    
    // save all beers in local db
    func saveBeers(beers : [Beer]) {
        do { try Disk.save(beers, to: .documents, as: "Beers.json")} catch {}
    }
    
    // load all beers records from local db
    func loadBeers() -> [Beer] {
        let beers = (try? Disk.retrieve("Beers.json", from: .documents, as: [Beer].self)) ?? []
        return beers
    }
    
}
