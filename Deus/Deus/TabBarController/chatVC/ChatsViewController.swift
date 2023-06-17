//
//  ChatsViewController.swift
//  Deus
//
//  Created by Novastrid on 15/06/23.
//

import UIKit

class ChatsViewController: UIViewController {
   
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var tableView: UITableView!
    var num = 10
    
//    @IBOutlet weak var collectioncellHight: NSLayoutConstraint!
    
    var searchController = UISearchController()
    var apiManager = ApiManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchBar()
        
//        apiManager.uploadDataToDB()
        
        tableView.dataSource = self
        tableView.dataSource = self
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        self.collectionView.register(CollectionViewCell.nib, forCellWithReuseIdentifier: CollectionViewCell.identifier)
        self.tableView.register(TableViewCell.nib, forCellReuseIdentifier: TableViewCell.identifier)
        
        if num != 0{
//            collectioncellHight.constant = 80
            
            collectionView.isHidden = false
        }else{
            collectionView.isHidden = true
//            collectioncellHight.constant = 0
        }
        
    }
    
    func configureSearchBar() {
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchBar.delegate = self
        searchController.delegate = self
    }

    
}

extension ChatsViewController:UISearchBarDelegate, UISearchControllerDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        search(searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search("")
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let query = searchBar.text, !query.isEmpty else { return }

    }
    
    func search(_ query: String) {
        
//        if query.count >= 1 {
//            filteredNotes = allNotes.filter { $0.text!.lowercased().contains(query.lowercased()) }
//        } else{
//            filteredNotes = allNotes
//        }
//        tableView.reloadData()
    }
}

extension ChatsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500
           // return UITableView.automaticDimension
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCell.identifier) as! TableViewCell
        
        return cell
    }
    
    
}
extension ChatsViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath) as! CollectionViewCell
        
        return cell
    }
    
    
    
    
    
}
