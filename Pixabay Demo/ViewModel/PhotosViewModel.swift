//
//  PhotosViewModel.swift
//  Pixabay Demo
//
//  Created by Omar Aksim on 7/24/20.
//  Copyright © 2020 Omar Aksim. All rights reserved.
//

import UIKit

class PhotosViewModel:NSObject {
    
    private var photos: [PhotoViewModel] = []
    
    func selectedPhoto(index: Int) -> PhotoViewModel? {
        if photos.indices.contains(index) {
            return photos[index]
        }
        return nil
    }
    
    func loadPhotos(complition:@escaping ([PhotoViewModel]) -> ()){
        searchPhotos(query: "", complition: complition)
    }
    
    func searchPhotos(query: String, complition:@escaping ([PhotoViewModel]) -> ()){
        PixabayService.shared.search(query: query, success: { (photos) in
            self.photos.removeAll()
            self.photos = photos.map({ (photo) -> PhotoViewModel in
                return PhotoViewModel(photo: photo)
            })
            complition(self.photos)
            
        }) { (error) in
            complition([])
        }
    }
    
}

extension PhotosViewModel: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return photos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: PhotoTableViewCell.ID) as! PhotoTableViewCell
        cell.setup(viewModel: photos[indexPath.row])
        return cell
    }
    
}
