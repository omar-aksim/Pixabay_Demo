//
//  NetworkManager.swift
//  Pixabay Demo
//
//  Created by Omar on 7/23/20.
//  Copyright © 2020 Omar. All rights reserved.
//  https://shorturl.at/kwIVW

import Foundation

enum NetworkResponse:String {
    case success = "Success"
    case authenticationError = "You need to be authenticated first."
    case badRequest = "Bad request"
    case outdated = "The url you requested is outdated."
    case failed = "Network request failed."
    case noData = "Response returned with no data to decode."
    case unableToDecode = "We could not decode the response."
}

enum Result<String>{
    case success
    case failure(String)
}

struct NetworkManager {
    
    static func sendRequest<T:EndPointType, P:Codable>(_ requestBuilder: T, completion: @escaping (_ response: P?, _ error: String?) -> ()) {
        
        let router = Router<T>()
        router.request(requestBuilder) { (data, response, error) in
            if error != nil {
                completion(nil, error?.localizedDescription)
            }
            
            if let response = response as? HTTPURLResponse {
                let result = self.handleNetworkResponse(response)
                switch result {
                case .success:
                    guard let responseData = data else {
                        completion(nil, NetworkResponse.noData.rawValue)
                        return
                    }
                    do {
                        //let jsonData = try? JSONSerialization.jsonObject(with: responseData, options: .mutableContainers)
                        let obj:P? = try JSONDecoder().decode(P.self, from: responseData)
                        completion(obj, nil)
                    }catch let error {
                        completion(nil, error.localizedDescription)
                    }
                case .failure(let networkFailureError):
                    completion(nil, networkFailureError)
                }
            }
        }
    }
    
    fileprivate static func handleNetworkResponse(_ response: HTTPURLResponse) -> Result<String>{
        switch response.statusCode {
        case 200...299: return .success
        case 401...500: return .failure(NetworkResponse.authenticationError.rawValue)
        case 501...599: return .failure(NetworkResponse.badRequest.rawValue)
        case 600: return .failure(NetworkResponse.outdated.rawValue)
        default: return .failure(NetworkResponse.failed.rawValue)
        }
    }
}
