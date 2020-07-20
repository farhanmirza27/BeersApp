//
//  NameCell.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

// delegate for favourite tap actions.
protocol NameCellDelegate : class {
    func markAsFavourite(beer : BeerViewModel)
    func unmarkAsFavourite(beerId : String)
}

class NameCell : UITableViewCell {
    // delegate
    weak var delegate : NameCellDelegate?
    var beer : BeerViewModel? {
        didSet {
            guard let beer = beer else {return}
            nameLabel.text = beer.name
            if beer.isFav {
                favBtn.setImage(UIImage(named : "heart-filled"), for: .normal)
            }
            else {
                favBtn.setImage(UIImage(named : "heart"), for: .normal)
            }
        }
    }
    // sub-views
    var nameLabel = UIComponents.shared.label(text: "",alignment: .center, fontName: FontName.Bold, fontSize: 18)
    var favBtn    = UIComponents.shared.buttonWithImage(imageName: "heart")
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style : style, reuseIdentifier : reuseIdentifier)
        setupLayout()
    }
    
    private func setupLayout() {
        asBasicCell()
        addSubViews(views: nameLabel,favBtn)
        NSLayoutConstraint.activate([
            
            favBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            favBtn.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            favBtn.heightAnchor.constraint(equalToConstant: 30),
            favBtn.widthAnchor.constraint(equalToConstant: 30),
            
            nameLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
            nameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            nameLabel.topAnchor.constraint(equalTo: favBtn.bottomAnchor, constant: 16),
            nameLabel.bottomAnchor.constraint(equalTo: bottomAnchor,constant: -16)
        ])
        
        // add targets
        favBtn.addTarget(self, action: #selector(didCLickFav), for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // favourite button event handler..
    @objc func didCLickFav() {
        guard let beer = beer  else {return}
        
        if favBtn.currentImage == UIImage(named : "heart-filled") {
            delegate?.unmarkAsFavourite(beerId: beer.id)
            favBtn.setImage(UIImage(named : "heart"), for: .normal)
        }
        else {
            delegate?.markAsFavourite(beer: beer)
            favBtn.setImage(UIImage(named : "heart-filled"), for: .normal)
        }
    }
}

