//
//  BeersListRouter.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

class BeersListRouter  : PresenterToRouterBeersListProtocol {
    // creating module..
    static func createModule() -> BeersListViewController {
        let view = BeersListViewController()
        let presenter : ViewToPresenterBeersListProtocol & InteractorToPresenterBeersListProtocol = BeersListPresenter()
        let interactor : PresenterToInteractorBeersListProtocol = BeersListInteractor()
        let router : PresenterToRouterBeersListProtocol = BeersListRouter()
        let apiManager : APIManagerProtocol = APIManager()
        let dataManager : DataManagerProtocol = DataManager()
        
        // injecting
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.router = router
        interactor.presenter = presenter
        interactor.apiManager = apiManager
        interactor.dataManager = dataManager
        return view
    }
    
    // navigate to detail view..
    func showDetail(beer: BeerViewModel, from : BeersListViewController) {
        let module = BeerDetailRouter.createModule(beer: beer)
        module.delegate = from
        from.navigationController?.pushViewController(module, animated: true)
    }
}
