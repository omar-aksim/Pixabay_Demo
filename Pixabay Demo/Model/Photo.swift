//
//  Photo.swift
//  Pixabay Demo
//
//  Created by Omar Aksim on 7/23/20.
//  Copyright © 2020 Omar Aksim. All rights reserved.
//

import Foundation

struct Photo: Codable {
    
    let id:Int
    let tags: String?
    let thumbnail:String?
    let userName: String?
    let image:String?
    let likes : Int?
    let favorites: Int?
    let comments: Int?

    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case tags = "tags"
        case thumbnail = "previewURL"
        case userName = "user"
        case image = "largeImageURL"
        case likes = "likes"
        case favorites = "favorites"
        case comments = "comments"
    }
    
}
