//
//  RecommendCell.swift
//  FilmList
//
//  Created by 박다현 on 6/24/24.
//

import UIKit
import Kingfisher

class RecommendCell: UICollectionViewCell {
    
    let imageView = {
        let img = UIImageView()
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 15
        img.clipsToBounds = true
        return img
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.layer.cornerRadius = 10
        imageView.clipsToBounds = true
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getImage(url:String){
        let url = URL(string: url)
        imageView.kf.setImage(with: url)
    }
    
}
