//
//  postBodyCell.swift
//  Chatster
//
//  Created by Shanbo on 1/14/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit


class postBodyCell: UITableViewCell {
    
    
    @IBOutlet weak var headerView: UIView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var hideButton: UIButton!
    
    
    @IBOutlet weak var bodyView: UIView!
    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    @IBOutlet weak var likeButton: UIButton!
    
    @IBOutlet weak var commentButton: UIButton!
    
    @IBOutlet weak var shareButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}


