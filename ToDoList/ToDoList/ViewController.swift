//
//  ViewController.swift
//  ToDoList
//
//  Created by Yuan Xie on 2018-01-30.
//  Copyright © 2018 Yuan Xie. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var txtAddItem: UITextField!
    @IBOutlet weak var txtList: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        txtAddItem.delegate = self
       
        
        
    }

    @IBAction func didTapButton(_ sender: UIButton) {
        if let text = txtAddItem.text{ // to make sure the text is not equal to nil
            if text == ""{ // to make sure the text is not empty
                return
            }
            txtList.text.append("\(text)\n")
            txtAddItem.text = ""
            UserDefaults.standard.set(txtList.text, forKey: "myList")
        }
    
    }
    
    @IBAction func reset(_ sender: Any) {
        
        txtList.text = nil
        UserDefaults.standard.set(txtList.text, forKey: "myList")
        //let defaults = UserDefaults.standard
        
    
      //  UIButton.background
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if UserDefaults.standard.object(forKey: "myList") != nil{
            txtList.text = UserDefaults.standard.object(forKey: "myList") as! String
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let text = txtAddItem.text! // to make sure the text is not equal to nil
          
        txtList.text.append("\(String(describing: text))\n")
        
        txtAddItem.text = ""
        UserDefaults.standard.set(txtList.text, forKey: "myList")
    
        return false
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    


}

