//
//  chatCell.swift
//  Chatster
//
//  Created by Shanbo on 1/21/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class chatCell: UITableViewCell {

    @IBOutlet weak var msgLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
