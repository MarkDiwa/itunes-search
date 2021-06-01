//
//  SearchResultViewController.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import UIKit

class SearchResultViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @objc
    private func refresh() {
        print("Refresh")
    }

}

extension SearchResultViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}

extension SearchResultViewController: UISearchBarDelegate {
    
}

private extension SearchResultViewController {
    
    func setup() {
        setupTableView()
        setupSearchBar()
    }
    
    func setupTableView() {
        tableView.tableHeaderView = spinnerFooterView
        tableView.dataSource = self
        tableView.delegate = self
        registerCell()
        let refreshControl = UIRefreshControl()
        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl
        registerCell()
    }
    
    func registerCell() {
        tableView.register(SearchResultTableViewCell.nib,
                           forCellReuseIdentifier: SearchResultTableViewCell.reuseIdentifier)
    }
    
    func setupSearchBar() {
        searchBar.delegate = self
    }
    
    func reloadTable() {
        tableView.tableHeaderView = nil
        tableView.tableFooterView = nil
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    var spinnerFooterView: UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
}
