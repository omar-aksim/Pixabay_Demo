//
//  PixabayApiResponse.swift
//  Pixabay Demo
//
//  Created by Omar Aksim on 7/23/20.
//  Copyright © 2020 Omar Aksim. All rights reserved.
//  https://shorturl.at/kwIVW

import Foundation

struct PixabayApiResponse<T: Codable>: Codable {
    let total: Int
    let totalResult: Int
    let data: T
    
    enum CodingKeys: String, CodingKey {
        case total = "total"
        case totalResult = "totalHits"
        case data = "hits"
    }
}
