//
//  ImageListManager.swift
//  Pagnination fetch api
//
//  Created by Shivaditya Kumar on 16/02/22.
//

import Foundation
struct ImageListResponseElement: Codable {
    var id, author: String
    var width, height: Int
    var url, downloadURL: String

    enum CodingKeys: String, CodingKey {
        case id, author, width, height, url
        case downloadURL = "download_url"
    }
}

typealias ImageListResponse = [ImageListResponseElement]
