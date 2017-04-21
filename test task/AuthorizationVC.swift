//
//  ViewController.swift
//  test task
//
//  Created by Illia Verba on 4/20/17.
//  Copyright © 2017 steelkiwi. All rights reserved.
//

import UIKit

class Authorization: UIViewController {
    @IBOutlet var Login: UITextField!
    @IBOutlet var Password: UITextField!

    @IBAction func Submit(_ sender: Any) {
        Auth.init().requestMaker(username: Login.text!, password: Password.text!, success:{ (response) in
            if response == 200 {
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let controller = storyboard.instantiateViewController(withIdentifier: "Search")
                DispatchQueue.main.async {
                   self.present(controller, animated: true, completion: nil) 
                }
            } 
        })
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

