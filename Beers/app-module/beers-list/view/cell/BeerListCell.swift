//
//  BeerListCell.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

class BeerListCell : UITableViewCell {
    var beer : BeerViewModel? {
        didSet {
            guard let beer = beer else {return}
            nameLabel.text = beer.name
            favImage.isHidden = !beer.isFav // show or hide favourite icon..
        }
    }
    
    var nameLabel = UIComponents.shared.label(text: "")
    var favImage   = UIComponents.shared.ImageView(imageName: "heart-filled") // default..
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupLayout()
    }
    
    private func setupLayout() {
        asBasicCell()
        
        // setup sub-views.
        addSubViews(views: favImage,nameLabel)
        NSLayoutConstraint.activate([
            
            favImage.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            favImage.topAnchor.constraint(equalTo: nameLabel.topAnchor),
            favImage.widthAnchor.constraint(equalToConstant: 20),
            favImage.heightAnchor.constraint(equalToConstant: 20),
            
            nameLabel.leadingAnchor.constraint(equalTo: favImage.trailingAnchor,constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
