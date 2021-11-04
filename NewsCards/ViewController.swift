//
//  ViewController.swift
//  NewsCards
//
//  Created by Personal on 23/10/21.
//

import UIKit
import Cards

class ViewController: UIViewController {
    
    static let cellSideMargin = 20
    weak var collectionView: UICollectionView!
    weak var bottomBarBG: UIView!
    
    var articles: [Article]?
    
    override func loadView() {
        super.loadView()
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        setBottomBar()
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: self.view.layoutMarginsGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: self.bottomBarBG.topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
        ])
        self.collectionView = collectionView
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = .white
        self.collectionView.dataSource = self
        self.collectionView.delegate = self
        self.collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.cellIdentifier)
        self.collectionView.register(UINib(nibName: "HeaderCollectionReusableView", bundle: nil),
                                        forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                        withReuseIdentifier: HeaderCollectionReusableView.identifier)
        NetworkManager.shared().getDailyHighlights { articles in
            if articles.count > 0 {
                self.articles = articles
                self.collectionView.reloadData()
            }
        }
    }
    
    func setBottomBar() {
        let backgroundView = UIView(frame: .zero)
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(backgroundView)
        backgroundView.backgroundColor = .red
        backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
        backgroundView.heightAnchor.constraint(equalToConstant: 80).isActive = true
        bottomBarBG = backgroundView
        
        let button = UIButton(type: .custom)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(UIImage(named: "test"), for: .normal)
//        button.addTarget(self, action:Selector("callMethod"), forControlEvents: UIControlEvents.TouchDragInside)
        button.widthAnchor.constraint(equalToConstant: 45).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [button])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fill
        backgroundView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 10),
            stackView.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor, constant: 0)
//            stackView.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor),
//            stackView.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor),
//            stackView.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor)
        ])
        
        
    }

}

extension ViewController: UICollectionViewDataSource {

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return articles?.count ?? 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.cellIdentifier, for: indexPath) as! CollectionViewCell
        if let articles = articles, indexPath.item < articles.count {
            cell.isShimmer = false
            cell.cofigureCell(article: articles[indexPath.item])
        } else {
            cell.isShimmer = true
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCollectionReusableView.identifier, for: indexPath) as! HeaderCollectionReusableView
        header.configHeader()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: 300, height: collectionView.bounds.size.height * 0.1)
    }
}

extension ViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = DetailsViewController()
        vc.article = articles?[indexPath.row]
        self.present(vc, animated: true, completion: nil)
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.size.width - CGFloat((ViewController.cellSideMargin * 2)), height: collectionView.bounds.size.height * 0.45)
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 10, left: CGFloat(ViewController.cellSideMargin), bottom: 10, right: CGFloat(ViewController.cellSideMargin))
    }
}
