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
    @IBOutlet weak var lastSearchLabel: UILabel!
    var searchResultViewModel: SearchResultsViewModel!
    
    init(searchResultViewModel: SearchResultsViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.searchResultViewModel = searchResultViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        guard searchResultViewModel.shouldSearchOnViewLoad else {
            reloadTable()
            return
        }
        search()
    }
    
    @objc
    private func refresh() {
        search()
    }

}

extension SearchResultViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResultViewModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SearchResultTableViewCell.reuseIdentifier,
                                                 for: indexPath)
        guard let searchResultCell = cell as? SearchResultTableViewCell else { return cell }
        guard let searchViewModel = searchResultViewModel.createSearchViewModel(from: indexPath.row) else {
            return searchResultCell
        }
        searchResultCell.searchResultDetailViewModel = searchViewModel
        return searchResultCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}

extension SearchResultViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        search()
    }
}

private extension SearchResultViewController {
    
    func setup() {
        setupTableView()
        setupSearchBar()
        guard !searchResultViewModel.lastSearchDateString.isEmpty else { return }
        lastSearchLabel.text = searchResultViewModel.lastSearchDateString
    }
    
    func setupTableView() {
        tableView.tableHeaderView = spinnerView
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
        searchBar.text = searchResultViewModel.searchString
    }
    
    func reloadTable() {
        tableView.tableHeaderView = nil
        tableView.refreshControl?.endRefreshing()
        tableView.reloadData()
    }
    
    func search() {
        searchResultViewModel.searchString = searchBar.text ?? ""
        searchResultViewModel.search { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success:
                self.lastSearchLabel.text = self.searchResultViewModel.lastSearchDateString
                self.reloadTable()
            case .failure(let error):
                self.reloadTable()
                print(error.localizedDescription)
            }
        }
    }
    
    var spinnerView: UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 100))
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
}
