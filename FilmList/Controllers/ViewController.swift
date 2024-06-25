//
//  ViewController.swift
//  FilmList
//
//  Created by 박다현 on 6/24/24.
//

import UIKit

class ViewController: BaseViewController {
    
    let network = NetworkManager.shared
    
    let mainView = RecommendListView()
    
    var data:[[Item]] = [[Item(posterPath: "")],[Item(posterPath: "")]]
   
    var imageData:[Backdrop] = []
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }

    override func configureView(){
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.rowHeight = 140
        mainView.tableView.separatorStyle = .none
        mainView.tableView.register(RecommendListCell.self, forCellReuseIdentifier: RecommendListCell.identifier)
    }
    
    func getData(){
        let group = DispatchGroup()
        
        group.enter()
        DispatchQueue.global().async(group: group){
            self.network.fetchSimilar(id: 1022789, type:APIType.similar.rawValue){ value in
                self.data[0] = value.results
                group.leave()
            }
        }
        
        group.enter()
        DispatchQueue.global().async(group: group){
            self.network.fetchSimilar(id: 1022789, type:APIType.recommendations.rawValue){ value in
                self.data[1] = value.results
                group.leave()
            }
        }
        
        group.enter()
        DispatchQueue.global().async(group: group){
            self.network.fetchImages(id: 1022789) { value in
                self.imageData = value.backdrops
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            self.mainView.tableView.reloadData()
        }
    }

}


extension ViewController:UITableViewDelegate, UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "비슷한 영화"
        case 1:
            return "추천 영화"
        case 2:
            return "포스터"
        default:
            return "error"
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mainView.tableView.dequeueReusableCell(withIdentifier: RecommendListCell.identifier, for: indexPath) as! RecommendListCell
        cell.collectionView.delegate = self
        cell.collectionView.dataSource = self
        cell.collectionView.register(RecommendCell.self, forCellWithReuseIdentifier: RecommendCell.identifier)
        cell.collectionView.tag = indexPath.section
        print(cell.collectionView.tag)
        cell.collectionView.reloadData()
        return cell
    }
    
    
}

extension ViewController:UICollectionViewDelegate, UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        if collectionView.tag == 2{
            return imageData.count
        }else{
            return data[collectionView.tag].count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RecommendCell.identifier, for: indexPath) as! RecommendCell
        if collectionView.tag == 2{
            cell.getImage(url: "https://image.tmdb.org/t/p/w500" + imageData[indexPath.row].filePath)
        }else{
            cell.getImage(url: "https://image.tmdb.org/t/p/w500" + data[collectionView.tag][indexPath.row].posterPath)
        }

        return cell
    
    }
    
    
}



