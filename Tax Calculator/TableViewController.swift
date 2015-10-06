//
//  TableViewController.swift
//  
//
//  Created by wirawan sanusi on 6/21/15.
//
//

import UIKit

class TableViewController: UITableViewController, UITextFieldDelegate {

    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var taxSlider: UISlider!
    @IBOutlet weak var priceTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        priceTextField.delegate = self
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        
        priceTextLabel.text = ""
        
        return true
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        textField.resignFirstResponder()
        
        calculateTax()
        
        return true
    }

    @IBAction func didTapped(sender: AnyObject) {
        
        priceTextField.resignFirstResponder()
        
        calculateTax()
    }
    
    
    @IBAction func sliderDidChangeValue(sender: AnyObject) {
        
        calculateTax()
    }
    
    func calculateTax() {
        
        let priceString: Double? = NSString(string: priceTextField.text!).doubleValue
        
        if let convertedPrice = priceString {
            
            let price = convertedPrice
            displayPrice(price)
            return
        }
        
        displayPrice(nil)
    }
    
    func displayPrice(price: Double?) {
        
        if let finalPrice = price {
            
            let tax = Double(taxSlider.value) / 100.0
            let total = finalPrice + (finalPrice * tax)
            priceTextLabel.text = "¥\(Int(total)) (\(Int(taxSlider.value))%)"
            
        }else{
            
            priceTextLabel.text = "¥0"
        }
        
    }
   
}
