//
//  PhotoViewModel.swift
//  Pixabay Demo
//
//  Created by Omar Aksim on 7/24/20.
//  Copyright © 2020 Omar Aksim. All rights reserved.
//

import UIKit

class PhotoViewModel {
    
    private var photo: Photo
    
    init(photo: Photo) {
        self.photo = photo
    }
    
    func comments() -> String{
        if let comments = photo.comments {
            return "\(comments) Comments"
        }
        return  "0 Comments"
    }
    
    func favorites() -> String{
        if let favorites = photo.favorites {
            return "\(favorites) Favorites"
        }
        return  "0 Favorites"
    }
    
    func likes() -> String{
        if let likes = photo.likes {
            return "\(likes) Likes"
        }
        return  "0 Likes"
    }
    
    func title() -> String {
        return photo.userName ?? ""
    }
    
    func decription() -> String {
        return photo.tags ?? ""
    }
    
    func thambnail() -> URL? {
        if let thumbnail = photo.thumbnail {
            return URL(string: thumbnail)
        }
        return nil
    }
    
    func image() -> URL? {
        if let image = photo.image {
            return URL(string: image)
        }
        return nil
    }
}
