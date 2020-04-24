//
//  ViewController.swift
//  TestTagList
//
//  Created by TrungHD-D1 on 4/16/20.
//  Copyright © 2020 TrungHD-D1. All rights reserved.
//

import UIKit

// This work in ios 12 to 12.2
class BaseTagCollectionView: UICollectionView {
    private var shouldInvalidateLayout = false

    override func layoutSubviews() {
        super.layoutSubviews()
        if shouldInvalidateLayout {
            collectionViewLayout.invalidateLayout()
            shouldInvalidateLayout = false
        }
    }

    override func reloadData() {
        shouldInvalidateLayout = true
        super.reloadData()
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: BaseTagCollectionView!
    @IBOutlet weak var collectionFlowLayout: TagListFlowLayout!
    
    var sizingCell: TagCollectionCell?

    let TAGS = ["Tech", "Design", "Humor", "Travel", "Music", "Writing", "Social Media", "Life", "Education", "Edtech", "Education Reform", "Photography", "Startup", "Poetry", "Women In Tech", "Female Founders", "Business", "Fiction", "Love", "Food", "Sports"]

    override func viewDidLoad() {
        super.viewDidLoad()

        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        let cellNib = UINib(nibName: "TagCollectionCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: "TagCollectionCell")
        sizingCell = (cellNib.instantiate(withOwner: nil, options: nil) as NSArray).firstObject as! TagCollectionCell?
        
        self.collectionFlowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }

}


extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return TAGS.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TagCollectionCell", for: indexPath) as! TagCollectionCell
        self.configureCell(cell: cell, forIndexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: TagCollectionCell?, forIndexPath indexPath: IndexPath) {
        let tag = TAGS[indexPath.row]
        cell?.lbTitle.text = tag
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        self.configureCell(cell: self.sizingCell, forIndexPath: indexPath)
        let size = self.sizingCell?.systemLayoutSizeFitting(UIView.layoutFittingCompressedSize)
        if let sz = size, sz.width > 0, sz.height > 0 {
            return sz
        }
        return CGSize(width: 100, height: 40)
    }
}



