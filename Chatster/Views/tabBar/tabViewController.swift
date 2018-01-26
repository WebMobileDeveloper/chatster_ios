//
//  tabViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/13/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class tabViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBar.barTintColor = .blue
        self.tabBar.tintColor = .white
        self.tabBar.unselectedItemTintColor = .white
        
        //    UIImage(named: "selected_item")
        let numberOfItems = CGFloat(tabBar.items!.count)
        let tabBarItemSize = CGSize(width: tabBar.frame.width / numberOfItems, height: tabBar.frame.height)
        self.tabBar.selectionIndicatorImage = UIImage(named: "selected_item")?.resizeImage(targetSize: tabBarItemSize)
        //tabBar.selectionIndicatorImage = UIImage.imageWithColor(UIColor(netHex:0xe00628), size: tabBarItemSize).resizableImageWithCapInsets(UIEdgeInsetsZero)
    }
    

}
