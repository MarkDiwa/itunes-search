//
//  SearchResultDetailViewController.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Kingfisher
import UIKit

class SearchResultDetailViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var directorLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    @IBOutlet weak var trackURLLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var trackArtworkImageView: UIImageView!
    
    var searchResultDetailViewModel: SearchResultDetailViewModel!
    
    init(searchResultDetailViewModel: SearchResultDetailViewModel) {
        super.init(nibName: nil, bundle: nil)
        self.searchResultDetailViewModel = searchResultDetailViewModel
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        titleLabel.text = searchResultDetailViewModel.detailTitle
        directorLabel.text = searchResultDetailViewModel.detailDirector
        genreLabel.text = searchResultDetailViewModel.detailGenre
        trackURLLabel.text = searchResultDetailViewModel.detailTrackUrl
        descriptionLabel.text = searchResultDetailViewModel.detailDescription
        guard let url = searchResultDetailViewModel.detailArtwork else { return }
        trackArtworkImageView.kf.setImage(with: url, placeholder: UIImage(named: "img-movie-placeholder"))

    }

}
