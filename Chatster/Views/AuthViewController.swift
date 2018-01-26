//
//  AuthViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/12/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet weak var authButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewDidLayoutSubviews() {
        authButton.layer.cornerRadius = authButton.frame.height / 2
        authButton.clipsToBounds = true
    }

}
