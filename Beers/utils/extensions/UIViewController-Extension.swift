//
//  UIViewController-Extension.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

extension UIViewController {
    // alert message
    func alert(message: String, title: String = "") {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let OKAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(OKAction)
        self.present(alertController, animated: true, completion: nil)
    }
    
    // Spinner
    func startAnimating() {
        let activityData = ActivityData(type : .circleStrokeSpin)
        NVActivityIndicatorPresenter.sharedInstance.startAnimating(activityData)
    }
    
    func stopAnimating() {
        NVActivityIndicatorPresenter.sharedInstance.stopAnimating()
    }
}
