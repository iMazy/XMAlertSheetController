//
//  ViewController.swift
//  XMAlertSheetController
//
//  Created by Mazy on 2019/5/31.
//  Copyright © 2019 Mazy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func showAlertSheet() {
        
        let msg = "XMAlertSheetController is a great and customizable alert that can substitute UIAlertController sheet"
        
        let alertSheet = XMAlertSheetViewController(title: nil, message: msg)
        
        alertSheet.addAction(XMAlertAction(title: "Allow", style: .destructive, action: {
            
        }))
        alertSheet.addAction(XMAlertAction(title: "No Thanks", style: .default, action: {
            
        }))
        
        alertSheet.addAction(XMAlertAction(title: "Cancel", style: .cancel))
        self.present(alertSheet, animated: true, completion: nil)
    }
    
    
    @IBAction func showSystemActionSheet() {
        showSystemAlertSheet()
    }
    
    func showSystemAlertSheet() {
        let alertVC = UIAlertController(title: "Main Title", message: "XMAlertSheetController is a great and customizable alert that can substitute UIAlertController sheet", preferredStyle: .actionSheet)
        alertVC.addAction(UIAlertAction(title: "Allow", style: .destructive, handler: { (_) in
            
        }))
        alertVC.addAction(UIAlertAction(title: "No Thanks", style: .default, handler: { (_) in
            
        }))
        alertVC.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}

