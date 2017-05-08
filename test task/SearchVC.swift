//
//  Search.swift
//  test task
//
//  Created by Illia Verba on 4/21/17.
//  Copyright © 2017 steelkiwi. All rights reserved.
//

import UIKit
import Foundation

class Search: UIViewController {
    var delay: Timer?
    
    @IBOutlet var SearchOutlet: UITextField!
    @IBAction func SearchField(_ sender: Any, forEvent event: UIEvent) {
        delay?.invalidate()
        delay = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerDelay), userInfo: nil, repeats: false)
        
    }
    
  @objc func timerDelay() {
        var query = URL(string: String(describing: RealTimeSearch.shared.searchUrl!) + self.SearchOutlet.text!.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)
        let usertoken = UserDefaults.standard.string(forKey: "UserToken")
        RealTimeSearch.init().searchRequestMaker(userCredentials: usertoken!, url: query!, success: { (response) in
            
            print(response)
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
    
    override func viewDidLoad() {
        
        self.navigationController?.isNavigationBarHidden = true
        
    }
    
}
