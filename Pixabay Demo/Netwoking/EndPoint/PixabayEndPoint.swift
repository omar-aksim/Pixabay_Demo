//
//  PixabayEndPoint.swift
//  Pixabay Demo
//
//  Created by Omar on 7/23/20.
//  Copyright © 2020 Omar. All rights reserved.
//  https://shorturl.at/kwIVW

import Foundation

enum PixabayEndPoint {
    case search(query:String)
}


extension PixabayEndPoint: EndPointType {
    
    var baseURL: URL? {
        return URL(string: "https://pixabay.com")
    }
    
    var parameters: Parameters? {
        var params = ["key": "17622459-f4f0aef0679acc0c72fc0a801"]
        switch self {
        case .search(let query):
            if !query.isEmpty {
                params["q"] = query.replacingOccurrences(of: " ", with: "+")
            }
            return params
        }
    }
    
    var headers: HTTPHeaders? {
        return HTTPTask.defaultHeaders
    }
    
    
    var task: HTTPTask {
        // we only have .get call
        return .requestParameters(bodyParameters: nil, bodyEncoding: .urlEncoding, urlParameters: parameters)
    }
    
    var path: String {
        return "/api/"
    }
    
    var pathArgs: [String]? {
        return nil
    }
    
    var httpMethod: HTTPMethod {
        return .get
    }
}
