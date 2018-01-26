//
//  alarmDetailViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/18/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class alarmDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items:[postItem] = []
    var alarmType:String = "Call"
    
    
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func onBackButtonClick(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.titleLabel.text = alarmType
        
        self.tableView.tableFooterView = UIView()
        for item in arrays {
            items.append(item.copy())
        }
        for item in arrays {
            items.append(item.copy())
        }
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
    
    
    @objc func detailButtonTapped(sender: UIButton){
        let buttonTag = sender.tag
        
        //        let cell = self.tableView.cellForRow(at: IndexPath(row: buttonTag, section: 0 ) ) as! contactSearchCell
        //        items[buttonTag].isHidden = !self.items[buttonTag].isHidden
        //        cell.bodyView.isHidden = self.items[buttonTag].isHidden
        //        tableView.beginUpdates()
        //        tableView.endUpdates()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var msgCell:messageContactCell!
        var callCell:callContactCell!
        var videoCell:videoContactCell!
        
        let item:postItem = items[indexPath.row]
        switch alarmType {
        case "Chat":  // message contact tab
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
            msgCell.detailButton.addTarget(self, action: #selector(detailButtonTapped(sender:)), for: .touchUpInside)
            msgCell.selectionStyle = .none
            return msgCell
            
        case "Call":  // call contact tab
            callCell = tableView.dequeueReusableCell(withIdentifier: "callContactCell") as! callContactCell
            callCell.nameLabel.text = item.name
            callCell.profileImage.image = item.profileImage?.profileImage(frameImage: UIImage(named: "circle-4")! )
            callCell.timeLabel.text = item.time
            callCell.actionLabel.text = item.lastCallType
            callCell.selectionStyle = .none
            return callCell
        case "Post":  // video contact tab
            videoCell = tableView.dequeueReusableCell(withIdentifier: "videoContactCell") as! videoContactCell
            videoCell.nameLabel.text = item.name
            videoCell.profileImage.image = item.profileImage?.profileImage(frameImage: UIImage(named: "circle-4")! )
            videoCell.timeLabel.text = item.time
            videoCell.actionLabel.text = item.lastCallType
            videoCell.selectionStyle = .none
            return videoCell
        case "Video":  // video contact tab
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


