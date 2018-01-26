//
//  postViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/13/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class postViewController: UIViewController,UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    
    var items:[postItem] = []

    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "postBodyCell"
    
    
    @IBAction func addButtonTapped(_ sender: Any) {
        items.append(arrays[Int(arc4random_uniform(6))].copy() )
        tableView.reloadData()
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.tableFooterView = UIView()
        
        tableView.estimatedRowHeight = 75
        tableView.rowHeight = UITableViewAutomaticDimension
        NotificationCenter.default.addObserver(forName: .UIContentSizeCategoryDidChange, object: .none, queue: OperationQueue.main) { [weak self] _ in
            self?.tableView.reloadData()
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: Delegates
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
        if items[indexPath.row].isHidden {
            return 75
        }else{
            return UITableViewAutomaticDimension
        }
    }
    
   
    @objc func hideButtonTapped(sender: UIButton){
        let buttonTag = sender.tag
        
        let cell = self.tableView.cellForRow(at: IndexPath(row: buttonTag, section: 0 ) ) as! postBodyCell
        items[buttonTag].isHidden = !self.items[buttonTag].isHidden
        cell.bodyView.isHidden = self.items[buttonTag].isHidden
        tableView.beginUpdates()
        tableView.endUpdates()
    }

    @objc func likeButtonTapped(sender: UIButton){
//        let buttonTag = sender.tag
//
//        let cell = self.tableView.cellForRow(at: IndexPath(row: buttonTag, section: 0 ) ) as! postBodyCell
//        items[buttonTag].isHidden = !self.items[buttonTag].isHidden
//        cell.bodyView.isHidden = self.items[buttonTag].isHidden
//        tableView.beginUpdates()
//        tableView.endUpdates()
    }
    @objc func commentButtonTapped(sender: UIButton){
//        let buttonTag = sender.tag
//
//        let cell = self.tableView.cellForRow(at: IndexPath(row: buttonTag, section: 0 ) ) as! postBodyCell
        if let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "postCommentViewController") as? postCommentViewController {
            
            if let navigator = self.navigationController {
                viewController.commentCount = items.count
                navigator.pushViewController(viewController, animated: true)
            }
        }
    }
    
    @objc func shareButtonTapped(sender: UIButton){
//        let buttonTag = sender.tag
        
//        let cell = self.tableView.cellForRow(at: IndexPath(row: buttonTag, section: 0 ) ) as! postBodyCell
//        items[buttonTag].isHidden = !self.items[buttonTag].isHidden
//        cell.bodyView.isHidden = self.items[buttonTag].isHidden
//        tableView.beginUpdates()
//        tableView.endUpdates()
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell:postBodyCell = tableView.dequeueReusableCell(withIdentifier: "postBodyCell") as! postBodyCell
        
        cell.nameLabel.text = items[indexPath.row].name
        cell.profileImage.image = items[indexPath.row].profileImage?.profileImage(frameImage: UIImage(named: "circle-4")! )
        cell.timeLabel.text = items[indexPath.row].time
        cell.msgLabel.text = items[indexPath.row].message
        cell.photoImage.image = self.items[indexPath.row].photoImage?.maskRoundedImage(radius: 10)
        
        cell.hideButton.tag = indexPath.row

        cell.hideButton.addTarget(self, action: #selector(hideButtonTapped(sender:)), for: .touchUpInside)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(likeButtonTapped(sender:)), for: .touchUpInside)
        
        cell.commentButton.tag = indexPath.row
        cell.commentButton.addTarget(self, action: #selector(commentButtonTapped(sender:)), for: .touchUpInside)
        
        cell.shareButton.tag = indexPath.row
        cell.shareButton.addTarget(self, action: #selector(shareButtonTapped(sender:)), for: .touchUpInside)
        

        cell.selectionStyle = .none
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
    
}


