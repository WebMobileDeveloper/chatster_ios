//
//  contactViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/17/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class contactViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items:[postItem] = []
    var tabIndex:Int = 0
    
    @IBOutlet weak var msgTab: UIView!
    @IBOutlet weak var callTab: UIView!
    @IBOutlet weak var videoTab: UIView!
    
    @IBOutlet weak var msgButton: UIButton!
    @IBOutlet weak var callButton: UIButton!
    @IBOutlet weak var videoButton: UIButton!
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var searchBarButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    @IBAction func msgTapped(_ sender: Any) {
        self.msgTab.backgroundColor = UIColor(red: 83/255, green: 164/255, blue: 230/255, alpha: 1)
        self.callTab.backgroundColor = UIColor.clear
        self.videoTab.backgroundColor = UIColor.clear
        self.searchBarButton.setBackgroundImage(UIImage(named: "message_plus"), for: .normal)
        self.tabIndex = 0
        self.tableView.reloadData()
    }
    
    @IBAction func callTapped(_ sender: Any) {
        self.msgTab.backgroundColor = UIColor.clear
        self.callTab.backgroundColor = UIColor(red: 83/255, green: 164/255, blue: 230/255, alpha: 1)
        self.videoTab.backgroundColor = UIColor.clear
        self.searchBarButton.setBackgroundImage(UIImage(named: "phone_plus"), for: .normal)
        //self.searchBarButton.imageView?.image = UIImage(named: "phone_plus")
        self.tabIndex = 1
        self.tableView.reloadData()
    }
    
    @IBAction func videoTapped(_ sender: Any) {
        self.msgTab.backgroundColor = UIColor.clear
        self.callTab.backgroundColor = UIColor.clear
        self.videoTab.backgroundColor = UIColor(red: 83/255, green: 164/255, blue: 230/255, alpha: 1)
        self.tabIndex = 2
        self.searchBarButton.imageView?.image = UIImage(named: "video_plus")
        self.tableView.reloadData()
    }
    
    
    
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier:[String] = ["messageContactCell", "callContactCell", "videoContactCell"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.msgTab.backgroundColor = UIColor(red: 83/255, green: 164/255, blue: 230/255, alpha: 1)
        
        
        self.tableView.tableFooterView = UIView()
        for item in arrays {
            items.append(item.copy())
        }
        for item in arrays {
            items.append(item.copy())
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
        return self.items.count
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
        return 65
    }
    
    
    @objc func chatButtonTapped(sender: UIButton){
        let buttonTag = sender.tag
        let cell = self.tableView.cellForRow(at: IndexPath(row: buttonTag, section: 0 ) ) as! messageContactCell
        
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "chatViewController") as? chatViewController {
            
            if let navigator = self.navigationController {
                viewController.name = cell.nameLabel.text!
                viewController.profileImage = cell.profileImage.image
                navigator.pushViewController(viewController, animated: true)
            }
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var msgCell:messageContactCell!
        var callCell:callContactCell!
        var videoCell:videoContactCell!
        
        let item:postItem = items[indexPath.row]
        switch tabIndex {
        case 0:  // message contact tab
            msgCell = tableView.dequeueReusableCell(withIdentifier: "messageContactCell") as! messageContactCell
            msgCell.nameLabel.text = item.name
            msgCell.profileImage.image = item.profileImage?.profileImage(frameImage: UIImage(named: "circle-4")! )
            
            switch item.lastType{
            case "message":
                msgCell.typeImage.image = nil
                msgCell.msgLabel.text = item.message
                msgCell.timeLabel.text = item.time
            case "photo":
                msgCell.typeImage.image = UIImage(named: "camera")
                msgCell.msgLabel.text = "photo"
                msgCell.timeLabel.text = item.time
            case "video":
                msgCell.typeImage.image = UIImage(named: "video_call_white")
                msgCell.msgLabel.text = "video"
                msgCell.timeLabel.text = item.time
            default:
                msgCell.typeImage.image = nil
                msgCell.msgLabel.text = ""
                msgCell.timeLabel.text = ""
            }
            msgCell.detailButton.tag = indexPath.row
            msgCell.detailButton.addTarget(self, action: #selector(chatButtonTapped(sender:)), for: .touchUpInside)
            msgCell.selectionStyle = .none
            return msgCell
            
        case 1:  // call contact tab
            callCell = tableView.dequeueReusableCell(withIdentifier: "callContactCell") as! callContactCell
            callCell.nameLabel.text = item.name
            callCell.profileImage.image = item.profileImage?.profileImage(frameImage: UIImage(named: "circle-4")! )
            callCell.timeLabel.text = item.time
            callCell.actionLabel.text = item.lastCallType
            callCell.selectionStyle = .none
            return callCell
            
        case 2:  // video contact tab
            videoCell = tableView.dequeueReusableCell(withIdentifier: "videoContactCell") as! videoContactCell
            videoCell.nameLabel.text = item.name
            videoCell.profileImage.image = item.profileImage?.profileImage(frameImage: UIImage(named: "circle-4")! )
            videoCell.timeLabel.text = item.time
            videoCell.actionLabel.text = item.lastCallType
            videoCell.selectionStyle = .none
            return videoCell
            
        default:
            
            return UITableViewCell()
        }
        
        
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

