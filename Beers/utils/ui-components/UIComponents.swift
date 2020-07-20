//
//  UIComponents.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//


import UIKit

// UIComponents class that provide views

class UIComponents {
    static let shared = UIComponents()
    private init() {
        // avoid instances for singleton pattern
    }
    
    // MARK: UILabel
    func label(text : String, alignment: NSTextAlignment = .left, fontName : String = FontName.Regular, fontSize : CGFloat = 14, color : UIColor = Theme.textColor) -> UILabel {
        let label = UILabel()
        label.font = UIFont(name: fontName, size: fontSize)
        label.text = text
        label.textColor = color
        label.textAlignment = alignment
        label.numberOfLines = 0
        return label
    }
    
    // MARK: UIImageView
    func ImageView(imageName : String = "", contentMode : UIView.ContentMode = .scaleAspectFill, cornerRadius : CGFloat = 0) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = contentMode
        imageView.image = UIImage(named: imageName)
        imageView.layer.cornerRadius  = cornerRadius
        imageView.clipsToBounds = true
        return imageView
    }
    
    // MARK: UITableView
    func tableView(separartorStyle :  UITableViewCell.SeparatorStyle = .singleLine) -> UITableView {
        let tableView = UITableView()
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = separartorStyle
        return tableView
    }
    
    // MARK: UIButton
    func buttonWithImage(imageName : String , tintColor : UIColor = Theme.textColor) -> UIButton {
        let button  = UIButton(type: .system)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.tintColor = tintColor
        button.backgroundColor = .white
        return button
    }
}



