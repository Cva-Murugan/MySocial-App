//
//  ContactViewController.swift
//  Deus
//
//  Created by Novastrid on 16/06/23.
//

import UIKit

class ContactViewController: UIViewController {

    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}


extension ContactViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier) as! ProfileTableViewCell
        
        
        
        return cell
    }
    
}
