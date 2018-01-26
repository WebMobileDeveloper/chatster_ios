//
//  profileViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/13/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class profileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func settingsButtonTapped(_ sender: Any) {
    }
    
    var name:String = "CalMcAleer"
    var profileImage:String = "person1.jpg"
    var location:String = "Atlanta, GA"
    var status:String = "Creator of Chatster"
    var aboutMe:String = "I’m a seasoned and award-winning agency creative — a passionate leader with a proven track record for translating complex ideas into slick, successful campaigns."
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 75
        tableView.rowHeight = UITableViewAutomaticDimension
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: Delegates
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if tableView.isDragging {
            cell.transform = CGAffineTransform.init(scaleX: 1, y: 0.5)
            UIView.animate(withDuration: 0.3, animations: {
                cell.transform = CGAffineTransform.identity
            })
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        case 0:
            let cell:profileCell = tableView.dequeueReusableCell(withIdentifier: "profileCell") as! profileCell
            cell.profileImage.image = UIImage(named: profileImage)?.profileImage(frameImage: UIImage(named: "circle-4")! )
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell:profileCell = tableView.dequeueReusableCell(withIdentifier: "nameCell") as! profileCell
            cell.itemLabel.text = name
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell:profileCell = tableView.dequeueReusableCell(withIdentifier: "locationCell") as! profileCell
            cell.itemLabel.text = location
            cell.selectionStyle = .none
            return cell
        case 3:
            let cell:profileCell = tableView.dequeueReusableCell(withIdentifier: "statusCell") as! profileCell
            cell.itemLabel.text = status
            cell.selectionStyle = .none
            return cell
        case 4:
            let cell:profileCell = tableView.dequeueReusableCell(withIdentifier: "aboutCell") as! profileCell
            cell.itemLabel.text = aboutMe
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
        
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
