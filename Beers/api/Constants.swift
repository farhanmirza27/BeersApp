//
//  Constants.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import Foundation

struct BeersApp {
    // APP keys
    struct AppKeys {
        static let sandboxKey = "1f689a1fe3ad74870b1ebf806136ee3d"
    }
    // API URLs
    struct ApiURL {
        static let beersListURL = "https://sandbox-api.brewerydb.com/v2/beers?key=\(AppKeys.sandboxKey)"
    }
}
