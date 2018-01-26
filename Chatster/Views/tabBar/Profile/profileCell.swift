//
//  profileCell.swift
//  Chatster
//
//  Created by Shanbo on 1/19/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class profileCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var itemLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
