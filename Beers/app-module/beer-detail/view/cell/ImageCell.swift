//
//  ImageCell.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit
import Kingfisher

class ImageCell : UITableViewCell {
    
    var imageURL : String? {
        didSet {
            cacheImage(image: imageURL)
        }
    }
    var beerImageView = UIComponents.shared.ImageView(imageName : "placeholder")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style : style, reuseIdentifier : reuseIdentifier)
        setupLayout()
    }
    
    // setup sub-views layout.
    private func setupLayout() {
        asBasicCell()
        addSubViews(views: beerImageView)
        NSLayoutConstraint.activate([
            beerImageView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            beerImageView.heightAnchor.constraint(equalToConstant: 150),
            beerImageView.widthAnchor.constraint(equalToConstant: 150),
            beerImageView.centerXAnchor.constraint(equalTo: centerXAnchor),
            beerImageView.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // load and cache image..
    func cacheImage(image: String?) {
        if let imageUrl = image {
            let url = URL(string: imageUrl)
            let placeholderImage = UIImage(named: "placeholder")
            beerImageView.kf.indicatorType = .activity
            beerImageView.kf.setImage(with: url, placeholder: placeholderImage)
        }
    }
}

