//
//  ContactsViewController.swift
//  Deus
//
//  Created by Novastrid on 15/06/23.
//

import UIKit

struct Contacts{
    //var conactIMg: UIImage
    var contactName: String
}


class ContactsViewController: UIViewController{


    @IBOutlet weak var tableView: UITableView!
    
    var ContactTest: [Contacts] = [
                        Contacts(contactName: "Aaradhya "),
                        Contacts(contactName: "Adah"),
                        Contacts(contactName: "Adhira"),
                        Contacts(contactName: "Alisha"),
                        Contacts(contactName: "Amoli"),
                        Contacts(contactName: "Anaisha"),
                        Contacts( contactName: "Ananya"),
                        Contacts(contactName: "Avni"),
                        Contacts( contactName: "Carina"),
                        Contacts(contactName: "Chara"),
                        Contacts(contactName: "Drishti"),
                        Contacts( contactName: "Ela"),
                        Contacts(contactName: "Eshika"),
                        Contacts( contactName: "Geetika"),
                        Contacts( contactName: "Gulika"),
                        Contacts( contactName: "Hiya"),
                        Contacts( contactName: "Hiral"),
                        Contacts( contactName: "Ira"),
                        Contacts( contactName: "Ishana"),
                        Contacts(contactName: "Jeevika"),
                        Contacts( contactName: "Kaia"),
                        Contacts( contactName: "Kashvi"),
                        Contacts( contactName: "Keya"),
                        Contacts( contactName: "Kimaya"),
                        Contacts(contactName: "Krisha"),
                        Contacts( contactName: "Mirai")
    ]
    
    
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
        return ContactTest.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ContactViewCell.identifier) as! ContactViewCell
        cell.contactName.text = ContactTest[indexPath.row].contactName
        return cell
    }
}
