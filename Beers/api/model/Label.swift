//
//  Label.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

// Label API model
struct Label : Codable {
    let icon : String?
    let medium : String?
    let large : String?
    let contentAwareIcon : String?
    let contentAwareMedium : String?
    let contentAwareLarge : String?
}
