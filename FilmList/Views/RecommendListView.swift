//
//  RecommendListView.swift
//  FilmList
//
//  Created by 박다현 on 6/24/24.
//

import UIKit
import SnapKit

class RecommendListView: UIView {

    let titleLabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 30)
        label.text = "타이틀"
        return label
    }()
    
    let tableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureHierarchy()
        configureLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureHierarchy(){
        self.addSubview(titleLabel)
        self.addSubview(tableView)
    }
    private func configureLayout(){
        titleLabel.snp.makeConstraints { make in
            make.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(20)
        }
        tableView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.horizontalEdges.bottom.equalToSuperview()
        }
    }

}
