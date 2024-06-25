//
//  Similar.swift
//  FilmList
//
//  Created by 박다현 on 6/24/24.
//

import Foundation


struct Similar:Decodable{
    let page: Int
    let results: [Item]
    let total_pages: Int
    let total_results: Int
}


// MARK: - Result
struct Item: Codable {
    let posterPath: String


    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"

    }
}




