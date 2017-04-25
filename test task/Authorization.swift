//
//  Authorization.swift
//  test task
//
//  Created by Illia Verba on 4/20/17.
//  Copyright © 2017 steelkiwi. All rights reserved.
//

import Foundation

class Auth {
    
    var json: Any?
    var url = URL?.self
    var userCredentials: String?
    
    let loginCheckUrl = URL(string: "https://api.github.com/user")
    
    
    static let shared = Auth()
    
    func login(request: URLRequest, success: @escaping (_ json: Int) -> Void)  {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error!)
            } else {
                success((response as? HTTPURLResponse)!.statusCode)

            }
        }
        task.resume()
    }
    
    func loginRequestMaker(userCredentials: String, url: URL, success: @escaping (_ response: Int) -> Void)  {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic \(userCredentials)", forHTTPHeaderField: "Authorization")
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        login(request: request, success:{ (json) in
            success(json)
        })
    }
    
    func userCredentialsMaker(username: String, password: String, success: @escaping (_ user: String) -> Void) {
        let loginString = username + ":" + password
        let loginData = loginString.data(using: String.Encoding.utf8)!
        userCredentials = loginData.base64EncodedString()
        success(userCredentials!)
    }
    
    
    
}
