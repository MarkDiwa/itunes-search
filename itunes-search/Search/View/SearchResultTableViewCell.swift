//
//  SearchResultTableViewCell.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import Kingfisher
import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    static let reuseIdentifier = "SearchResultTableViewCell"
    static let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    
    var searchResultDetailViewModel: SearchResultDetailViewModel? {
        didSet {
            guard let searchResultDetailViewModel = searchResultDetailViewModel else { return }
            trackNameLabel.text = searchResultDetailViewModel.cellTrackName
            priceLabel.text = searchResultDetailViewModel.cellPrice
            genreLabel.text = searchResultDetailViewModel.cellGenre
            guard let url = searchResultDetailViewModel.cellArtWork else { return }
            artworkImageView.kf.setImage(with: url, placeholder: UIImage(named: "img-movie-placeholder"))
        }
    }
}
