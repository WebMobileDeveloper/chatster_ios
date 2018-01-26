//
//  chatViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/22/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class chatViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    var name:String = ""
    var profileImage:UIImage!
    var messages:[String] = ["","Hello Kim", "How are you?","Hi Jhon, I'm fine", "Darma has send you jpg file", "Can you please check the rest of the designs?","Okay", "Will check and updated you soon.","Okay","Thank you."]
    var times:[String] = ["Today","1:43 PM","1:43 PM","1:44 PM","1:44 PM","1:44 PM","1:44 PM","1:45 PM","1:45 PM","1:46 PM","1:46 PM","1:46 PM"]
    var fromMe:[Int] = [0,1, 1, 2, 1, 1, 2, 2, 1, 1]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBarController?.tabBar.isHidden = true
        
        self.tableView.tableFooterView = UIView()
        tableView.estimatedRowHeight = 75
        tableView.rowHeight = UITableViewAutomaticDimension
        
        nameLabel.text = name
        profileImageView.image = profileImage
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        // Do any additional setup after loading the view.
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }

    // MARK: Delegates
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages.count
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
        
        var timeCell:chatTimeCell!
        var chatCell:chatCell!
        let rowIndex = indexPath.row
        switch fromMe[rowIndex] {
        case 0:
            timeCell = tableView.dequeueReusableCell(withIdentifier: "chatTimeCell") as! chatTimeCell
            timeCell.timeLabel.text = "     " + times[rowIndex] + "     "
            return timeCell
        case 1:
            chatCell = tableView.dequeueReusableCell(withIdentifier: "fromMeCell") as! chatCell
            chatCell.msgLabel.text = messages[rowIndex]
            chatCell.timeLabel.text = times[rowIndex]
            return chatCell
        case 2:
            chatCell = tableView.dequeueReusableCell(withIdentifier: "toMeCell") as! chatCell
            chatCell.msgLabel.text = messages[rowIndex]
            chatCell.timeLabel.text = times[rowIndex]
            return chatCell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true)
    }
    
    @IBAction func callButtonTapped(_ sender: Any) {
    }
    
    @IBAction func videoButtonTapped(_ sender: Any) {
    }
}
