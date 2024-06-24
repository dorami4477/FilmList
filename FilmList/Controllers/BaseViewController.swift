//
//  BaseViewController.swift
//  FilmList
//
//  Created by 박다현 on 6/24/24.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    func configureUI(){
        view.backgroundColor = .white
    }
    
}
