//
//  ReusableID.swift
//  FilmList
//
//  Created by 박다현 on 6/24/24.
//

import UIKit

protocol ReuseIdentifierProtocol{
    static var identifier:String { get }
}

extension UICollectionViewCell:ReuseIdentifierProtocol{
    static var identifier:String{
        return String(describing: self)
    }
}

extension UITableViewCell:ReuseIdentifierProtocol{
    static var identifier:String{
        return String(describing: self)
    }
}

extension UIViewController:ReuseIdentifierProtocol{
    static var identifier:String{
        return String(describing: self)
    }
}
