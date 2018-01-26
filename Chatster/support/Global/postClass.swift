//
//  postClass.swift
//  Chatster
//
//  Created by Shanbo on 1/14/18.
//  Copyright © 2018 chat. All rights reserved.
//

import Foundation
import UIKit

class postItem{
    var name:String = ""
    var profileImage: UIImage?
    var time:String = ""
    var message:String
    var photoImage:UIImage?
    var lastType:String = "messsage"
    var lastCallType:String = "incoming"
    
    var like:Bool = false
    var reply:Bool = false
    var isHidden:Bool = false
    
    
    init(name:String = "", profileImage:UIImage? = UIImage(named: "person"), time:String = "Just now", msgStr:String = "", photoImage:UIImage? = nil, lastType:String = "message",lastCallType:String = "incoming", like:Bool=false,reply:Bool=false) {
        
        self.name = name
        self.profileImage = profileImage
        self.time = time
        self.message = msgStr
        self.photoImage = photoImage
        self.lastType = lastType
        self.lastCallType = lastCallType
        self.like = like
        self.reply = reply
        
    }
    func copy() -> postItem {
        let newValue = postItem()
        newValue.name = name
        newValue.profileImage = profileImage
        newValue.time = time
        newValue.message = message
        newValue.photoImage = photoImage
        newValue.lastType = lastType
        newValue.lastCallType = lastCallType
        newValue.like = like
        newValue.reply = reply
        newValue.isHidden = isHidden
        return newValue
    }
}
