//
//  EditViewController.swift
//  Deus
//
//  Created by Novastrid on 16/06/23.
//

import UIKit

struct PublicProfile{
    var firstName:String!
    var lastName:String?
}
struct PrivateProfile{
    var email:String!
    var phoneNumber: String!
}

class EditViewController: UIViewController {

    
    var sectionTitiles = ["1","2"]
    
    @IBOutlet weak var tableView: UITableView!
    
    var firstName = UserDefaults.standard.string(forKey: "displayName")
///    var LastName = UserDefaults.standard.string(forKey: "-")
    
    var email = UserDefaults.standard.string(forKey: "email")
    var phonenumber = UserDefaults.standard.string(forKey: "phoneNumber")
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(EditTableViewCell.nib, forCellReuseIdentifier: EditTableViewCell.identifier)
       
    }
    
    @IBAction func saveBtnTap(_ sender: Any) {
        print("save")
    }
    

}

extension EditViewController: UITableViewDataSource,UITableViewDelegate{

    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EditTableViewCell.identifier ) as! EditTableViewCell
        if indexPath.section == 0{
            if indexPath.row == 0{
                cell.leftLabel.font = UIFont.systemFont(ofSize: 11.0)
                cell.leftLabel.textColor = UIColor(red: 109/255.0, green: 109/255.0, blue: 113/255.0, alpha: 1.0 )
                cell.leftLabel.text = "PUBLIC PROFILE"
                cell.rightLabel.isHidden = true
                cell.contentView.backgroundColor = UIColor(red: 239/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1.0 )
            } else if indexPath.row == 1{
                cell.leftLabel.text = "First Name"
                cell.rightLabel.text = firstName
            }else{
                cell.leftLabel.text = "Last Name"
                cell.rightLabel.text = "-"
            }
        }else{
            if indexPath.row == 0{
                cell.leftLabel.font = UIFont.systemFont(ofSize: 11.0)
                cell.leftLabel.textColor = UIColor(red: 109/255.0, green: 109/255.0, blue: 113/255.0, alpha: 1.0 )
                cell.leftLabel.text = "PRIVATE DETAILS"
                cell.rightLabel.isHidden = true
                cell.contentView.backgroundColor = UIColor(red: 239/255.0, green: 238/255.0, blue: 242/255.0, alpha: 1.0 )
            }else if indexPath.row == 1{
                cell.leftLabel.text = "E-Mail Address"
                cell.rightLabel.text = email
            }else{
                cell.leftLabel.text = "Phone Number"
                cell.rightLabel.text = phonenumber
            }
        }
        return cell
    }
    
}
