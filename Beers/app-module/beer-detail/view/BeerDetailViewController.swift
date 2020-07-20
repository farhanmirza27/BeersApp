//
//  BeerDetailViewController.swift
//  Beers
//
//  Created by Farhan Mirza on 19/07/2020.
//  Copyright © 2020 Farhan Mirza. All rights reserved.
//

import UIKit

// table view rows enum
private enum DetailRow {
    case Name
    case Image
    case Description
}

class BeerDetailViewController : UITableViewController {
    
    var presenter : ViewToPresenterBeerDetailProtocol?
    var delegate : BeerDetailViewDelegate?
    var beer : BeerViewModel?
    
    // rows
    private var rows : [DetailRow] = [.Name,.Image,.Description]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
    }
    
    private func setupLayout() {
        navigationItem.title = "Detail"
        tableView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 30, right: 0)
        tableView.separatorStyle = .none
        tableView.backgroundColor = Theme.bgColor
    }
    
    deinit {
        print("de-init called") // no retain cycle..
    }
}

extension BeerDetailViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch rows[indexPath.row] {
        case .Name:
            let cell = NameCell()
            cell.beer = self.beer
            cell.delegate = self
            return cell
        case .Image:
            let cell = ImageCell()
            cell.imageURL  = beer?.imageURL
            return cell
        case .Description:
            let cell = DescriptionCell()
            cell.descriptionLabel.text = beer?.description
            return cell
        }
    }
}

extension BeerDetailViewController : PresenterToViewBeerDetailProtocol {
    //  can be extended..
}

extension BeerDetailViewController : NameCellDelegate {
    // mark as favourite
    func markAsFavourite(beer: BeerViewModel) {
        presenter?.markAsFavourite(beerId: beer.id)
        delegate?.refreshListView()
    }
    
    // unmark as favourite
    func unmarkAsFavourite(beerId: String) {
        presenter?.unmarkAsFavourite(beerId: beerId)
        delegate?.refreshListView()
    }
}
