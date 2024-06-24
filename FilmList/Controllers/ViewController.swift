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
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }

    override func configureUI(){
        super.configureUI()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.rowHeight = 140
        mainView.tableView.separatorStyle = .none
        mainView.tableView.register(RecommendListCell.self, forCellReuseIdentifier: RecommendListCell.identifier)
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
        switch indexPath.section{
            case 0:
                network.fetchSimilar(id: 1022789, type:APIType.similar.rawValue){ value in
                    cell.data = value.results
                }
            case 1:
            network.fetchSimilar(id: 1022789, type:APIType.recommendations.rawValue){ value in
                cell.data = value.results
            }
            case 2:
            network.fetchImages(id: 1022789) { value in
                cell.imageData = value.backdrops
            }
            default:
            network.fetchSimilar(id: 1022789, type:APIType.similar.rawValue){ value in
                cell.data = value.results
            }
        }
        
        return cell
    }
    
    
}



