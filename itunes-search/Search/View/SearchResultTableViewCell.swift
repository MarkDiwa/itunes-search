//
//  SearchResultTableViewCell.swift
//  itunes-search
//
//  Created by Mark Dennis Diwa on 6/1/21.
//

import UIKit

class SearchResultTableViewCell: UITableViewCell {

    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var trackNameLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var genreLabel: UILabel!
    
    static let reuseIdentifier = "SearchResultTableViewCell"
    static let nib = UINib(nibName: reuseIdentifier, bundle: nil)
}
