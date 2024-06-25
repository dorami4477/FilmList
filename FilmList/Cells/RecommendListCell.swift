//
//  RecommendListCell.swift
//  FilmList
//
//  Created by 박다현 on 6/24/24.
//

import UIKit

class RecommendListCell: UITableViewCell {

    lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout(cellCount: 3))
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()

    }
    private func configureHierarchy(){
        contentView.addSubview(collectionView)
    }
    private func configureLayout(){
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func flowlayout(cellCount:CGFloat) -> UICollectionViewLayout{
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionCellWidth = (UIScreen.main.bounds.width - 40 ) / ( cellCount + 0.5 )
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth * 1.4)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 10
        return flowLayout
    }
    
}


