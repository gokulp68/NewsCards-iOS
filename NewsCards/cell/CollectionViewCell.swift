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
    var isShimmer = false {
        didSet {
            showShimmer(isShimmer)
        }
    }
    var shimmerViews = [UIView]()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // Set masks to bounds to false to avoid the shadow
        // from being clipped to the corner radius
        layer.cornerRadius = 5.0
        layer.masksToBounds = false
        
        contentView.layer.cornerRadius = 5.0
        contentView.layer.masksToBounds = true
        contentView.backgroundColor = .white
        setDropShadow()
        
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
        categoryLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(categoryLabel)
        NSLayoutConstraint.activate([
            categoryLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 10),
            categoryLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
//            categoryLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ])
        self.categoryLabel = categoryLabel
        
        let timeLabel = UILabel(frame: .zero)
        timeLabel.numberOfLines = 0
        timeLabel.textAlignment = .left
        timeLabel.translatesAutoresizingMaskIntoConstraints = false
        timeLabel.font = UIFont.systemFont(ofSize: 15)
        self.contentView.addSubview(timeLabel)
        NSLayoutConstraint.activate([
            timeLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            timeLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10),
            timeLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor, constant: -10)
        ])
        self.timeLabel = timeLabel
        
        let textLabel = UILabel(frame: .zero)
        textLabel.numberOfLines = 0
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.font = UIFont.boldSystemFont(ofSize: 17)
        textLabel.numberOfLines = 2
        self.contentView.addSubview(textLabel)
        NSLayoutConstraint.activate([
            textLabel.topAnchor.constraint(equalTo: categoryLabel.bottomAnchor, constant: 5),
            textLabel.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 10),
            textLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -10)
        ])
        self.titleLabel = textLabel
        
        let shimmerImageView = UIView(frame: .zero)
        shimmerImageView.translatesAutoresizingMaskIntoConstraints = false
        shimmerImageView.backgroundColor = .gray
        shimmerImageView.isHidden = true
        self.contentView.addSubview(shimmerImageView)
        NSLayoutConstraint.activate([
            shimmerImageView.topAnchor.constraint(equalTo: imageView.topAnchor),
            shimmerImageView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            shimmerImageView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            shimmerImageView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor)
        ])
        shimmerViews.append(shimmerImageView)
        
        let shimmerTitleView = UIView(frame: .zero)
        shimmerTitleView.translatesAutoresizingMaskIntoConstraints = false
        shimmerTitleView.backgroundColor = .gray
        shimmerTitleView.isHidden = true
        self.contentView.addSubview(shimmerTitleView)
        NSLayoutConstraint.activate([
            shimmerTitleView.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            shimmerTitleView.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            shimmerTitleView.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor),
            shimmerTitleView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor)
        ])
        shimmerViews.append(shimmerTitleView)
        
        let timeLabelShimmer = UIView(frame: .zero)
        timeLabelShimmer.translatesAutoresizingMaskIntoConstraints = false
        timeLabelShimmer.backgroundColor = .gray
        timeLabelShimmer.isHidden = true
        self.contentView.addSubview(timeLabelShimmer)
        NSLayoutConstraint.activate([
            timeLabelShimmer.topAnchor.constraint(equalTo: timeLabel.topAnchor),
            timeLabelShimmer.leadingAnchor.constraint(equalTo: timeLabel.leadingAnchor),
            timeLabelShimmer.trailingAnchor.constraint(equalTo: timeLabel.trailingAnchor),
            timeLabelShimmer.bottomAnchor.constraint(equalTo: timeLabel.bottomAnchor)
        ])
        shimmerViews.append(timeLabelShimmer)
        
        let categoryLabelShimmer = UIView(frame: .zero)
        categoryLabelShimmer.translatesAutoresizingMaskIntoConstraints = false
        categoryLabelShimmer.backgroundColor = .gray
        categoryLabelShimmer.isHidden = true
        self.contentView.addSubview(categoryLabelShimmer)
        NSLayoutConstraint.activate([
            categoryLabelShimmer.topAnchor.constraint(equalTo: categoryLabel.topAnchor),
            categoryLabelShimmer.leadingAnchor.constraint(equalTo: categoryLabel.leadingAnchor),
            categoryLabelShimmer.trailingAnchor.constraint(equalTo: categoryLabel.trailingAnchor),
            categoryLabelShimmer.bottomAnchor.constraint(equalTo: categoryLabel.bottomAnchor)
        ])
        shimmerViews.append(categoryLabelShimmer)
        
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
    
    public func cofigureCell(article: Article) {
        titleLabel.text = article.title
        categoryLabel.text = article.author
        timeLabel.text = Utils.shared().formatTime(timeString: article.publishedAt)
        imageView.sd_setImage(with: URL(string: article.urlToImage), completed: nil)
    }
    
    private func showShimmer(_ show: Bool) {
        for view in shimmerViews {
            view.isHidden = !show
        }
    }
}
