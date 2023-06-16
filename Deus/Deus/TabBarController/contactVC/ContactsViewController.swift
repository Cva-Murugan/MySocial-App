//
//  ContactsViewController.swift
//  Deus
//
//  Created by Novastrid on 15/06/23.
//

import UIKit

class ContactsViewController: UIViewController{


    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.register(ContactViewCell.nib, forCellReuseIdentifier: ContactViewCell.identifier)
        
    }

}

extension ContactsViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactViewCell.identifier) as! ContactViewCell
        return cell
    }
}
