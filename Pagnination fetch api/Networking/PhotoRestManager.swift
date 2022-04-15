//
//  PhotoRestManager.swift
//  Pagnination fetch api
//
//  Created by Shivaditya Kumar on 16/02/22.
//

import Foundation
import Moya

class PhotoRestManager : NSObject {
    static let shared = PhotoRestManager()
    private override init(){
        super.init()
    }
    private let provider = MoyaProvider<PhotoAPIProvider>.init()
    func getImageList(page: Int, limit: Int, handler : ((Result<ImageListResponse,Error>)->())?) {
        provider.request(.getImageList(page: page, limit: limit)) { result in
            switch result {
            case .success(let response):
                do {
                    let data = try JSONDecoder().decode(ImageListResponse.self, from: response.data)
                    handler?(.success(data))
                } catch let jsonDecodingError {
                    handler?(.failure(jsonDecodingError))
                }
            case .failure(let error):
                handler?(.failure(error))
            }
        }
    }
}
