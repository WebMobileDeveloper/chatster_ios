//
//  postCommentViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/20/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class postCommentViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var items:[postItem] = []
    var tabIndex:Int = 0
    var commentCount:Int = 0

    @IBOutlet weak var postCountLabel: UILabel!
    
    @IBOutlet weak var closeBarButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func closeButtonTapped(_ sender: Any) {
        let viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        self.navigationController!.popToViewController(viewControllers[viewControllers.count - 2], animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.tableView.tableFooterView = UIView()
        
        for item in arrays {
            items.append(item.copy())
        }
        for item in arrays {
            items.append(item.copy())
        }
        postCountLabel.text = " \(commentCount) Comments"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let item:postItem = items[indexPath.row]
        
        let commentCell = tableView.dequeueReusableCell(withIdentifier: "commentCell") as! videoContactCell
        commentCell.nameLabel.text = item.name
        commentCell.profileImage.image = item.profileImage?.profileImage(frameImage: UIImage(named: "circle-4")! )
        commentCell.actionLabel.text = item.message
        commentCell.timeLabel.text = item.time
        commentCell.selectionStyle = .none
        return commentCell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
}

