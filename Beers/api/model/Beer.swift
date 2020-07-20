//
//  Beer.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

// Beer API Model
struct Beer  : Codable {
    let id : String
    let name : String
    let description : String?
    let labels : Label?
}


