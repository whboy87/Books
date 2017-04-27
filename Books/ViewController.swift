//
//  ViewController.swift
//  Books
//
//  Created by SDS-012 on 2017. 4. 27..
//  Copyright © 2017년 SDS-012. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        openAlert()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func openAlert() {
        let alert = UIAlertController(title: "환영합니다.", message: "Books 앱을 시작합니다.", preferredStyle: UIAlertControllerStyle.alert)
        
        let okAction = UIAlertAction(title: "확인", style: UIAlertActionStyle.default, handler: nil)
        
        //let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel, handler: {
        //    (action: UIAlertAction) -> () in
        //   print(action.title!)
        //    self.view.backgroundColor = UIColor.red
        //})
        
        let cancelAction = UIAlertAction(title: "취소", style: UIAlertActionStyle.cancel) {
            (action: UIAlertAction) -> () in
            print(action.title!)
            self.view.backgroundColor = UIColor.red
        }
        
        alert.addAction(okAction)
        alert.addAction(cancelAction)
        
        self.present(alert, animated: true, completion: nil)
    }
    
}

