//
//  editProfileViewController.swift
//  Chatster
//
//  Created by Shanbo on 1/20/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit

class editProfileViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate  {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameField: UITextField!
    @IBOutlet weak var locationField: UIImageView!
    @IBOutlet weak var statusField: UITextField!
    @IBOutlet weak var aboutMeField: UITextView!
    @IBOutlet weak var buttonView: UIView!
    @IBAction func saveButtonTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    let profileImage = UIImage(named: "profile")
    
    @IBAction func editButtonTapped(_ sender: Any) {
        showChoiceAlert(target: self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aboutMeField.placeholder = "About Me"
        
        profileImageView.image = profileImage?.profileImage(frameImage: UIImage(named: "circle-4" )!)
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLayoutSubviews() {
        buttonView.layer.cornerRadius = buttonView.frame.height / 2
        buttonView.clipsToBounds = true
    }
    
    
    /*  Mark: ImagePickerControllerdelegate functions
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]){
        //        /*   select origin image  */
        let selected_image = info[UIImagePickerControllerOriginalImage] as? UIImage
        profileImageView.image = selected_image?.profileImage(frameImage: UIImage(named: "circle-4" )!)
       
        
        
//        /* select edited image   */
//        if let chosenImage = info[UIImagePickerControllerEditedImage] as? UIImage {
//            image.image = chosenImage.resizeAndCompress(newWidth: PROFILE_IMAGE_WIDTH, maxSize: MAX_UPLOAD_IMAGE_SIZE)
//        }
        self.dismiss(animated: true, completion: nil);
    }

}
