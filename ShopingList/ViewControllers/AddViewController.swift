//
//  AddViewController.swift
//  ShopingList
//
//  Created by PenguinRaja on 21.02.2021.
//

import UIKit

class AddViewController: UIViewController {
    
    var goodsList = Good.getNotes()
    
    @IBOutlet var productTextField: UITextField!
    @IBOutlet var amountTextField: UITextField!
    @IBOutlet var amountStepper: UIStepper!
    
    @IBOutlet var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addDoneButton(to: amountTextField)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showKeyboard(notification:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(showKeyboard(notification:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @IBAction func addButtonAction() {
        addProductToDB()
    }
    
    @IBAction func stepperActions(_ sender: UIStepper) {
        amountTextField.text = Int(sender.value).description
    }
    
    private func addProductToDB() {
        guard let name = productTextField.text else { return }
        guard let amount = amountTextField.text else { return }
        if (Int(amount) != 0) {
            print("\(amount)")
            goodsList.append(Good(name: name, quantity: 123, unitOfQuantity: "kg"))
        }
        
    }
}

extension AddViewController: UITextFieldDelegate {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if textField == productTextField {
            amountTextField.becomeFirstResponder()
        } else {
            addButtonAction()
        }
        return true
    }
    
    private func addDoneButton(to textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(
            title:"Done",
            style: .done,
            target: self,
            action: #selector(didTapDone)
        )
        
        let flexBarButton = UIBarButtonItem(
            barButtonSystemItem: .flexibleSpace,
            target: nil,
            action: nil
        )
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc private func didTapDone() {
        view.endEditing(true)
    }
    
    @objc func showKeyboard (notification: Notification) {
        guard let userInfo = notification.userInfo as? [String: Any],
            let keyboardInfo = (userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
            else { return}
        if notification.name != UIResponder.keyboardWillHideNotification {
            view.frame.origin.y = -(keyboardInfo.height / 2)
        }
    }
}
