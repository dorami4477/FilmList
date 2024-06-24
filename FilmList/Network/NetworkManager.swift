//
//  NetworkManager.swift
//  FilmList
//
//  Created by 박다현 on 6/24/24.
//

import Foundation
import Alamofire

class NetworkManager{
    
    static let shared = NetworkManager()
    private init(){}
    
    func fetchSimilar(id:Int,type:String, completionHandler:@escaping (Similar) -> Void){
        let url = APIUrl.base + "\(id)/" + type
        let header:HTTPHeaders = ["Authorization":APIKey.authorization, "accept": "application/json"]

        AF.request(url, 
                   method: .get,
                   headers:header)
        .responseDecodable(of: Similar.self){ response in
            
            switch response.result{
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func fetchImages(id:Int, completionHandler:@escaping (Poster) -> Void){
        let url = APIUrl.base + "\(id)/" + APIType.images.rawValue
        let header:HTTPHeaders = ["Authorization":APIKey.authorization, "accept": "application/json"]

        
        AF.request(url, headers:header).responseDecodable(of: Poster.self) { response in
            switch response.result{
            case .success(let value):
                completionHandler(value)
            case .failure(let error):
                print(error)
            }
        }
    }
}

