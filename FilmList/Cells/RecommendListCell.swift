//
//  RecommendListCell.swift
//  FilmList
//
//  Created by 박다현 on 6/24/24.
//

import UIKit

class RecommendListCell: UITableViewCell {

   lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: flowlayout())
    
    var data:[Item] = []{
        didSet{
            collectionView.reloadData()
        }
    }
   
    var imageData:[Backdrop] = []{
        didSet{
            collectionView.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureHierarchy()
        configureLayout()
        configureUI()

    }
    private func configureHierarchy(){
        contentView.addSubview(collectionView)
    }
    private func configureLayout(){
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    private func configureUI(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(RecommendCell.self, forCellWithReuseIdentifier: RecommendCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func flowlayout() -> UICollectionViewLayout{
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collectionCellWidth = (UIScreen.main.bounds.width - 40 ) / 3.5
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth * 1.4)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        flowLayout.minimumLineSpacing = 10
        return flowLayout
    }
    
}

extension RecommendListCell:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if imageData.count != 0{
            return imageData.count
        }else{
            return data.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCell.identifier, for: indexPath) as! RecommendCell
        if imageData.count != 0{
            cell.getImage(url: "https://image.tmdb.org/t/p/w500" + imageData[indexPath.row].filePath)
        }else{
            cell.getImage(url: "https://image.tmdb.org/t/p/w500" + data[indexPath.row].posterPath)
        }
        return cell
    
    }
    
    
}
