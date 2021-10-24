//
//  CollectionViewCell.swift
//  NewsCards
//
//  Created by Personal on 23/10/21.
//
import UIKit

class CollectionViewCell: UICollectionViewCell {

    static let cellIdentifier = "cell"
    
    weak var categoryLabel: UILabel!
    weak var titleLabel: UILabel!
    weak var timeLabel: UILabel!
    weak var imageView: UIImageView!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
        setDropShadow()
        
        contentView.backgroundColor = .red
        
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            imageView.widthAnchor.constraint(equalTo: self.contentView.widthAnchor),
            imageView.heightAnchor.constraint(equalTo: self.contentView.widthAnchor, multiplier: 2/3),
            imageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor)
        ])
        self.imageView = imageView
        imageView.image = UIImage(named: "test")
        
        let categoryLabel = UILabel(frame: .zero)
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.textAlignment = .left
        categoryLabel.text = "Technology"
        self.contentView.addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            categoryLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            categoryLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10)
        ])
        self.categoryLabel = categoryLabel
        
        let timeLabel = UILabel(frame: .zero)
        timeLabel.numberOfLines = 0
        timeLabel.textAlignment = .left
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.text = "October 22, 2021"
        self.contentView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            timeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10),
            timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -10)
        ])
        self.timeLabel = timeLabel
        
        let textLabel = UILabel(frame: .zero)
        textLabel.numberOfLines = 0
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.text = "EXCLUSIVE Canada says proposed U.S. EV tax credit could harm sector, mulls possible challenge"
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 10),
            textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 10)
        ])
        self.titleLabel = textLabel
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        fatalError("Interface Builder is not supported!")
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        fatalError("Interface Builder is not supported!")
    }

    override func prepareForReuse() {
        super.prepareForReuse()

    }
    
    
    private func setDropShadow() {
        // How blurred the shadow is
        layer.shadowRadius = 8.0

        // The color of the drop shadow
        layer.shadowColor = UIColor.black.cgColor

        // How transparent the drop shadow is
        layer.shadowOpacity = 0.7

        // How far the shadow is offset from the UICollectionViewCell’s frame
        layer.shadowOffset = CGSize(width: 0, height: 5)
        
        // Specify a shadowPath to improve shadow drawing performance
        layer.shadowPath = UIBezierPath(
            roundedRect: bounds,
            cornerRadius: 5.0
        ).cgPath
    }
}
