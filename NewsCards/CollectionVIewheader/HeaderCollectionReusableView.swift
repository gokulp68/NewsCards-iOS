//
//  HeaderCollectionReusableView.swift
//  NewsCards
//
//  Created by Personal on 24/10/21.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {
    
    static let identifier = "HeaderCollectionReusableView"
    @IBOutlet weak var titleStack: UIStackView!
    @IBOutlet weak var firstTitleLabel: UILabel!
    @IBOutlet weak var secondTitleLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        userImageView.widthAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        userImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.6).isActive = true
        
    }
    
    public func configHeader() {
        firstTitleLabel.text = "Sunday 24 October".uppercased()
        secondTitleLabel.text = "Today"
    }
    
}
