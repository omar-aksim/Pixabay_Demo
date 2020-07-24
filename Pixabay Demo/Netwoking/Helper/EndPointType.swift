//
//  EndPointType.swift
//  Pixabay Demo
//
//  Created by Omar on 7/23/20.
//  Copyright © 2020 Omar. All rights reserved.
//  https://shorturl.at/kwIVW

import Foundation

protocol EndPointType {
    var baseURL: URL? { get }
    var path: String { get }
    var httpMethod: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

