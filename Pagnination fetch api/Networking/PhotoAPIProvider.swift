//
//  PhotoAPIProvider.swift
//  Pagnination fetch api
//
//  Created by Shivaditya Kumar on 16/02/22.
//

import Foundation
import Moya

enum PhotoAPIProvider{
    case getImageList(page : Int, limit : Int)
}

extension PhotoAPIProvider : TargetType {
    var baseURL: URL{
        switch self {
        case .getImageList(page: let page, limit: let limit):
            return URL(string: "https://picsum.photos/v2/list?page=\(page)&limit=\(limit)")!
        }
    }
    
    var path: String{
        switch self {
        case .getImageList(page: _, limit: _):
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getImageList(page: _, limit: _):
            return .get
        }
    }
    var task: Task {
        switch self {
        case .getImageList(page: _, limit: _):
            return .requestPlain
            
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    var headers: [String : String]? {
        return nil
    }
}
