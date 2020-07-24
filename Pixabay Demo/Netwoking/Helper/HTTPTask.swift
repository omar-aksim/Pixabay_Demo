//
//  HTTPTask.swift
//  Pixabay Demo
//
//  Created by Omar on 7/23/20.
//  Copyright © 2020 Omar. All rights reserved.
//  https://shorturl.at/kwIVW

import Foundation

public typealias HTTPHeaders = [String:String]

public enum HTTPTask {
    case request
    
    case requestParameters(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?)
    
    case requestParametersAndHeaders(bodyParameters: Parameters?,
        bodyEncoding: ParameterEncoding,
        urlParameters: Parameters?,
        additionHeaders: HTTPHeaders?)
    
    // case download, upload...etc
}

extension HTTPTask {
    static var defaultHeaders:HTTPHeaders = [:]
}
