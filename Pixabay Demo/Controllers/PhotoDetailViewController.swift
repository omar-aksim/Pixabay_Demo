//
//  PhotoDetailViewController.swift
//  Pixabay Demo
//
//  Created by Omar Aksim on 7/24/20.
//  Copyright © 2020 Omar Aksim. All rights reserved.
//

import UIKit

class PhotoDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likes: UILabel!
    @IBOutlet weak var favorites: UILabel!
    @IBOutlet weak var comments: UILabel!
    @IBOutlet weak var tags: UILabel!
    @IBOutlet weak var descTextView: UITextView!
    
    var photoViewModel: PhotoViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let viewModel = photoViewModel else {
            imageView.image = #imageLiteral(resourceName: "placeholder")
            self.title = "Detail"
            return
        }
        
        imageView.load(url: viewModel.image(), placeholder: #imageLiteral(resourceName: "placeholder"))
        self.title = viewModel.title()
        comments.text = viewModel.comments()
        favorites.text = viewModel.favorites()
        likes.text = viewModel.likes()
        tags.text = viewModel.decription()
    }
    
}
