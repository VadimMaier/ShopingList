//
//  AddViewController.swift
//  ShopingList
//
//  Created by PenguinRaja on 21.02.2021.
//

import UIKit

class AddViewController: UIViewController {
    
    @IBOutlet var productTextField: UITextField!
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var amountStepper: UIStepper!
    
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension AddViewController: UITextFieldDelegate {
    
}
