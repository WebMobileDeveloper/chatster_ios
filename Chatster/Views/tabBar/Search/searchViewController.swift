//
//  searchViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/13/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class searchViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var tableView: UITableView!
    
    var items:[postItem] = []
    var searchedItems:[postItem] = []
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "contactSearchCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        for item in arrays {
            items.append(item.copy())
        }
        for item in arrays {
            items.append(item.copy())
        }
        
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target:self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        searchField.addTarget(self, action: #selector(textFieldDidChange(textField:)), for: UIControlEvents.editingChanged)
    }
    
    @objc func textFieldDidChange(textField: UITextField) {
        searchedItems.removeAll()
        _ = items.map {
            // alternative: not case sensitive
            if $0.name.lowercased().range(of:searchField.text!.lowercased()) != nil {
                //print("exists")
                searchedItems.append($0.copy())
            }
        }
        tableView.reloadData()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    @objc func dismissKeyboard() {
        //Causes the view (or one of its embedded text fields) to resign the first responder status.
        view.endEditing(true)
    }
    //MARK: Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (searchField.text?.count)! > 0 {
            return searchedItems.count
        }else{
            return self.items.count
        }
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
    
    
    @objc func messageButtonTapped(sender: UIButton){
        let buttonTag = sender.tag
        
//        let cell = self.tableView.cellForRow(at: IndexPath(row: buttonTag, section: 0 ) ) as! contactSearchCell
//        items[buttonTag].isHidden = !self.items[buttonTag].isHidden
//        cell.bodyView.isHidden = self.items[buttonTag].isHidden
//        tableView.beginUpdates()
//        tableView.endUpdates()
    }
    @objc func callButtonTapped(sender: UIButton){
        let buttonTag = sender.tag
        
//        let cell = self.tableView.cellForRow(at: IndexPath(row: buttonTag, section: 0 ) ) as! contactSearchCell
//        items[buttonTag].isHidden = !self.items[buttonTag].isHidden
//        cell.bodyView.isHidden = self.items[buttonTag].isHidden
//        tableView.beginUpdates()
//        tableView.endUpdates()
    }
    
    @objc func addButtonTapped(sender: UIButton){
        let buttonTag = sender.tag
        
        let cell = self.tableView.cellForRow(at: IndexPath(row: buttonTag, section: 0 ) ) as! contactSearchCell
        cell.messageButton.isHidden = false
        cell.callButton.isHidden = false
        cell.addButton.isHidden = true
        
        tableView.beginUpdates()
        tableView.endUpdates()
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:contactSearchCell = tableView.dequeueReusableCell(withIdentifier: "contactSearchCell") as! contactSearchCell
        var item:postItem!
        if (searchField.text?.count)! > 0 {
            item = searchedItems[indexPath.row]
            if indexPath.row > searchedItems.count-3 {
                cell.messageButton.isHidden = true
                cell.callButton.isHidden = true
                cell.addButton.isHidden = false
            }
        }else{
            item = items[indexPath.row]
        }
        
        cell.nameLabel.text = item.name
        cell.profileImage.image = item.profileImage?.profileImage(frameImage: UIImage(named: "circle-4")! )
        cell.addButton.layer.cornerRadius = cell.addButton.frame.height / 2
        cell.addButton.clipsToBounds = true
        
        cell.messageButton.tag = indexPath.row
        cell.callButton.tag = indexPath.row
        cell.addButton.tag = indexPath.row
        cell.messageButton.addTarget(self, action: #selector(messageButtonTapped(sender:)), for: .touchUpInside)
        cell.callButton.addTarget(self, action: #selector(callButtonTapped(sender:)), for: .touchUpInside)
        cell.addButton.addTarget(self, action: #selector(addButtonTapped(sender:)), for: .touchUpInside)
        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }

}
