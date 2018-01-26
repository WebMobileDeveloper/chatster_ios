//
//  alarmViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/13/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class alarmViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var items:[[String:String]]=[
        ["type":"Call", "image":"phone_white", "count": "4"],
        ["type":"Chat", "image":"message", "count": "20"],
        ["type":"Post", "image":"camera_and_message", "count": "5"],
        ["type":"Video", "image":"video_call_white", "count":"8"],
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
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
        
        let cell = self.tableView.cellForRow(at: IndexPath(row: buttonTag, section: 0 ) ) as! alarmTypeCell
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "alarmDetailViewController") as? alarmDetailViewController {
            if let navigator = self.navigationController {
                viewController.alarmType = cell.typeLabel.text!
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let typeCell:alarmTypeCell = tableView.dequeueReusableCell(withIdentifier: "alarmTypeCell") as! alarmTypeCell
        let item = items[indexPath.row]
        typeCell.typeImage.image = UIImage(named: item["image"]!)
        typeCell.typeLabel.text = item["type"]
        typeCell.counterLabel.text = item["count"]
        typeCell.detailButton.tag = indexPath.row
        typeCell.detailButton.addTarget(self, action: #selector(detailButtonTapped(sender:)), for: .touchUpInside)
        typeCell.selectionStyle = .none
        return typeCell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}


