//
//  ViewController.swift
//  Camera
//
//  Created by Moussa SOW on 21/04/2021.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    var picker: UIImagePickerController = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.allowsEditing = true
    }

    @IBAction func takePicture(_ sender: Any) {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            picker.sourceType = .camera
            present(picker, animated: true, completion: nil)
        }else{
            print("Pas de caméra")
        }
        
    }
    
    @IBAction func choosePicture(_ sender: Any) {
        picker.sourceType = .photoLibrary
        present(picker, animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        //if let photo = info[.originalImage] as? UIImage {
          //  imageView.image = photo
            //picker.dismiss(animated: true, completion: nil)
        //}
        if let photo = info[.editedImage] as? UIImage {
            imageView.image = photo
            picker.dismiss(animated: true, completion: nil)
        }
    }
}

