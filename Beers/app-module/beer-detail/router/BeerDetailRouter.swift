//
//  BeerDetailRouter.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

class BeerDetailRouter : PresenterToRouterBeerDetailProtocol {
    // creating module
    static func createModule(beer : BeerViewModel) -> BeerDetailViewController {
        let view = BeerDetailViewController()
        view.beer = beer
        let presenter : ViewToPresenterBeerDetailProtocol & InteractorToPresenterBeerDetailProtocol = BeerDetailPresenter()
        let interactor : PresenterToInteractorBeerDetailProtocol = BeerDetailInteractor()
        let router : PresenterToRouterBeerDetailProtocol = BeerDetailRouter()
        let apiManager : APIManagerProtocol = APIManager()
        let dataManager : DataManagerProtocol = DataManager()
        
        // Injection
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.apiManager = apiManager
        interactor.dataManager = dataManager
        return view
    }
}
