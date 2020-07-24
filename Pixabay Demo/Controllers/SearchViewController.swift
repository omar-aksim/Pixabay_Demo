//
//  SearchViewController.swift
//  Pixabay Demo
//
//  Created by Omar Aksim on 7/23/20.
//  Copyright © 2020 Omar Aksim. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    
    let searchController = UISearchController(searchResultsController: nil)
    let viewModel = PhotosViewModel()
    @IBOutlet weak var resultTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupSearchController()
        setupResultTableView()
    }
    
    func setupSearchController(){
        searchController.searchResultsUpdater = self
        searchController.obscuresBackgroundDuringPresentation = false
        navigationItem.searchController = searchController
        DispatchQueue.main.async { [weak self] in
            self?.searchController.searchBar.becomeFirstResponder()
        }
    }
    func setupResultTableView(){
        resultTableView.register(UINib(nibName: PhotoTableViewCell.ID, bundle: nil), forCellReuseIdentifier: PhotoTableViewCell.ID)
        resultTableView.delegate = self
        resultTableView.dataSource = viewModel
    }
}



extension SearchViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        if let searchText = searchController.searchBar.text {
            viewModel.searchPhotos(query: searchText) { (photos) in
                DispatchQueue.main.async {
                    self.resultTableView.reloadData()
                }
            }
        }else{
            viewModel.loadPhotos { (photos) in
                DispatchQueue.main.async {
                    self.resultTableView.reloadData()
                }
            }
        }
        
    }
}

extension SearchViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        let alert = UIAlertController(title: "Action", message: "Are you want's to see more detail?", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { (action) in
            DispatchQueue.main.async {
                let detailController = PhotoDetailViewController.instantiateFromStoryboard(appStoryboard: .Home)
                detailController.photoViewModel = self.viewModel.selectedPhoto(index: indexPath.row)
                self.navigationController?.pushViewController(detailController, animated: true)
            }
            
        }))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
    
}
