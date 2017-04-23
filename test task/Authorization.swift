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
    let url = URL(string: "https://api.github.com/user")
    let searchUrl = URL(string: "https://api.github.com/search/repositories")
    
    
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
    
    func requestMaker(username: String, password: String, success: @escaping (_ response: Int) -> Void)  {
        let loginString = username + ":" + password
        let loginData = loginString.data(using: String.Encoding.utf8)!
        let base64LoginString = loginData.base64EncodedString()
        var request = URLRequest(url: self.url!)
        request.httpMethod = "GET"
        request.setValue("Basic \(base64LoginString)", forHTTPHeaderField: "Authorization")
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        login(request: request, success:{ (json) in
            success(json)
        })
    }
    
    
}
