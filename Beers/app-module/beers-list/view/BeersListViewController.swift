//
//  BeersListViewController.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

fileprivate let reuseIdentifier = "BeerListCellID"

class BeersListViewController : UIViewController {
    // presenter
    var presenter : ViewToPresenterBeersListProtocol?
    
    // sub-views
    var favSwitch  = UISwitch()
    var favLabel = UIComponents.shared.label(text: "Show only favourites",alignment: .right)
    var tableView = UIComponents.shared.tableView()
    // refresh control
    var dataRefreshControl = UIRefreshControl()
    
    var beers  = [BeerViewModel]()
    
    // view state..
    var showFavouriteOnly = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        self.startAnimating()
        
        // load beers 
        presenter?.loadBeers()
    }
    
    private func setupLayout() {
        navigationItem.title = "Beers"
        view.backgroundColor = Theme.bgColor
        
        tableView.register(BeerListCell.self, forCellReuseIdentifier: reuseIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.refreshControl = dataRefreshControl
        
        view.addSubViews(views: favLabel,favSwitch,tableView)
       
        // check for iOS Version for safe area layout 
        if #available(iOS 11, *) {
            NSLayoutConstraint.activate([
                favSwitch.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 16)]
            )
        }
        else {
            NSLayoutConstraint.activate([
                favSwitch.topAnchor.constraint(equalTo: view.topAnchor,constant: 16)]
            )
        }
        NSLayoutConstraint.activate([
            favSwitch.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -16),
            favLabel.centerYAnchor.constraint(equalTo: favSwitch.centerYAnchor),
            favLabel.trailingAnchor.constraint(equalTo: favSwitch.leadingAnchor,constant: -16),
            
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: favSwitch.bottomAnchor,constant: 16),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // add target
        favSwitch.addTarget(self, action: #selector(didTapFavSwitch(sender:)), for: .valueChanged)
        dataRefreshControl.addTarget(self, action: #selector(pullDownRefresh), for: .valueChanged)
    }
    
    // Favourite only switch action handler
    @objc func didTapFavSwitch (sender : UISwitch) {
        if !sender.isOn {
            self.showFavouriteOnly = false
            self.presenter?.showAll()
        }
        else {
            self.showFavouriteOnly = true
            self.presenter?.showFavouriteOnly()
        }
    }
    
    // pull refresh control action
    @objc func pullDownRefresh() {
        self.favSwitch.isOn = false
        self.presenter?.loadBeers()
    }
}

//MARK: TableViewDataSoruce
//MARK: TableViewDelegate
extension BeersListViewController : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! BeerListCell
        cell.beer = beers[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // navigate to detail view
        self.presenter?.showDetails(beer : beers[indexPath.row], from : self)
    }
}


//MARK: PresenterToViewBeersListProtocol
extension BeersListViewController : PresenterToViewBeersListProtocol {
    // beers data loaded successfully
    func success(beers: [BeerViewModel]) {
        self.stopAnimating()
        self.beers = beers
        self.dataRefreshControl.endRefreshing()
        self.tableView.reloadData()
    }
    
    // beer data failed
    func failure(errorMessage: String) {
        self.stopAnimating()
        self.dataRefreshControl.endRefreshing()
        self.alert(message: errorMessage)
    }
}


//MARK: BeerDetailViewDelegate
// delegate to receive events from detail view
extension BeersListViewController : BeerDetailViewDelegate {
    // refresh list when beer marked as favourite or not as favourite
    func refreshListView() {
        if showFavouriteOnly {
            self.presenter?.showFavouriteOnly()
        }
        else {
            self.presenter?.showAll()
        }
    }
}
