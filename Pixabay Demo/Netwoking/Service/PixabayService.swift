//
//  PixabayService.swift
//  Pixabay Demo
//
//  Created by Omar on 7/23/20.
//  Copyright © 2020 Omar. All rights reserved.
//

import Foundation

class PixabayService {
    
    static var shared = PixabayService()
    
    func search(query:String, success: @escaping ([Photo])->(), fail: @escaping (String?)->()){
        let endpoint = PixabayEndPoint.search(query: query)
        NetworkManager.sendRequest(endpoint) { (response: PixabayApiResponse<[Photo]>?, error: String?) in
            
            if let photos = response?.data {
                success(photos)
            }else{
                fail(error)
            }
        }
    }
    
    
    
}
