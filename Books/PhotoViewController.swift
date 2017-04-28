//
//  PhotoViewController.swift
//  Books
//
//  Created by SDS-012 on 2017. 4. 27..
//  Copyright © 2017년 SDS-012. All rights reserved.
//

import UIKit

class PhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {

    var activeTextField: UITextField? = nil
    var appdelegate: AppDelegate? = UIApplication.shared.delegate as? AppDelegate
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var coverImageView: UIImageView!
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var authorTextField: UITextField!
    @IBOutlet var urlTextField: UITextField!

    //TextField
    func textFieldDidBeginEditing(_ textField: UITextField) {
        activeTextField = textField
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        activeTextField = nil
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        
        return true
    }
    
    func setNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(showKeyboard(notification:)) , name: .UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(hideKeyboard(notification:)) , name: .UIKeyboardWillHide, object: nil)
    }
    
    func showKeyboard(notification: NSNotification) {
        var info = notification.userInfo!
        let keyboardSize = (info[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue.size
        let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, keyboardSize!.height + 10, 0.0)
        
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        
        var aRact: CGRect = self.view.frame
        aRact.size.height -= keyboardSize!.height
        
        if let activeField = self.activeTextField {
            if(!aRact.contains(activeField.frame.origin)){
                self.scrollView.scrollRectToVisible(activeField.frame, animated: true)
            }
        }
    }
    
    func hideKeyboard(notification: NSNotification) {
        let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
        self.scrollView.contentInset = contentInsets
        self.scrollView.scrollIndicatorInsets = contentInsets
        self.view.endEditing(true)
    }
    
    @IBAction func close(_ sender: Any) {
        
        if let title = titleTextField.text {
            let book: Book = Book(title: title, author: authorTextField.text, coverImage: coverImageView.image, url: urlTextField.text)
            
            appdelegate?.books.append(book)
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        coverImageView.isUserInteractionEnabled = true
        coverImageView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(selectPhoto)))
        
        setNotification()
        
    }
    
    func selectPhoto(sender: UITapGestureRecognizer) {
        if sender.state == .ended {
            let picker = UIImagePickerController()
            picker.sourceType = UIImagePickerControllerSourceType.savedPhotosAlbum
            picker.allowsEditing = true
            picker.delegate = self
            
            self.present(picker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerOriginalImage] as? UIImage {
            coverImageView.contentMode = .scaleToFill
            coverImageView.image = pickedImage
        }
        
        picker.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
