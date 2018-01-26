//
//  ViewControllerExtention.swift
//  Chatster
//
//  Created by Shanbo on 1/12/18.
//  Copyright © 2018 chat. All rights reserved.
//

import UIKit
func showChoiceAlert(target:UIViewController){
    let choiceAlert = UIAlertController(title: "Select type", message: "Select your profile image type.", preferredStyle: UIAlertControllerStyle.alert)
    
    choiceAlert.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction!) in
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        imagePickerController.allowsEditing = true;
        imagePickerController.delegate = target as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePickerController.sourceType = UIImagePickerControllerSourceType.photoLibrary
        target.present(imagePickerController, animated: true, completion: nil)
    }))
    
    choiceAlert.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction!) in
        let imagePickerController: UIImagePickerController = UIImagePickerController()
        imagePickerController.delegate = target as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        imagePickerController.sourceType = UIImagePickerControllerSourceType.camera
        target.present(imagePickerController, animated: true, completion: nil)
    }))
    target.present(choiceAlert, animated: true, completion: nil)
}
