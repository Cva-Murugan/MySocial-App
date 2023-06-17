//
//  ProfileViewController.swift
//  Deus
//
//  Created by Novastrid on 15/06/23.
//

import UIKit

struct profilePage{
    let image: UIImage!
    let label: String!
}


class ProfileViewController: UIViewController {

    
    @IBOutlet weak var profilePicture: UIImageView!
    
    @IBOutlet weak var userName: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    var profileArr : [profilePage] = [
        profilePage(image: UIImage(systemName: "person.crop.circle")?.withTintColor(.blue), label: "Account Details"),
        profilePage(image: UIImage(systemName: "gearshape.fill"), label: "Settings"),
        profilePage(image: UIImage(systemName: "phone.and.waveform.fill")?.withTintColor(.green), label: "Contact Us")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.isScrollEnabled = false
        self.tableView.register(ProfileTableViewCell.nib, forCellReuseIdentifier: ProfileTableViewCell.identifier)
    }
    
    @IBAction func logOutBtnTap(_ sender: Any) {
        navigation()
    }
    

    func navigation(){
        
        UserDefaults.standard.set(false, forKey: "logIn_status")
       
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let yourVC = mainStoryboard.instantiateViewController(withIdentifier: "rootNAV") as! loginNavigationController
        
        let sceneDelegate = UIApplication.shared.connectedScenes.first!.delegate as! SceneDelegate
        sceneDelegate.window!.rootViewController = yourVC
        
        self.navigationController?.popToRootViewController(animated: true)
            
    }
    
}

extension ProfileViewController: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProfileTableViewCell.identifier) as! ProfileTableViewCell
        
        switch indexPath.row{
        case 0:
            cell.imgLabel.tintColor = UIColor(red: 108/225.0, green: 119/225.0, blue: 239/225.0, alpha: 1.0)
        case 1:
            cell.imgLabel.tintColor = UIColor(red: 136/225.0, green: 131/225.0, blue: 150/225.0, alpha: 1.0)
        case 2:
            cell.imgLabel.tintColor = UIColor(red: 135/225.0, green: 228/225.0, blue: 151/225.0, alpha: 1.0)
        default: break
            
        }
        
        cell.imgLabel.image = profileArr[indexPath.row].image
        cell.profileLables.text = profileArr[indexPath.row].label
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
     
        _ = UIStoryboard(name: "Main", bundle: nil)
        switch indexPath.row{
        case 0:
            let vc = storyboard?.instantiateViewController(identifier: "editVC") as! EditViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 1:
            let vc = storyboard?.instantiateViewController(identifier: "settingsVC") as! SettingsViewController
            self.navigationController?.pushViewController(vc, animated: true)
        case 2:
            let vc = storyboard?.instantiateViewController(identifier: "contactVC") as! ContactViewController
            self.navigationController?.pushViewController(vc, animated: true)
        default:
            print(indexPath.row)
        }
    }
    
}
