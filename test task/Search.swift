//
//  Search.swift
//  test task
//
//  Created by Illia Verba on 4/25/17.
//  Copyright © 2017 steelkiwi. All rights reserved.
//

import Foundation

class RealTimeSearch {
    
    let searchUrl = URL(string: "https://api.github.com/search/repositories?q=")
    
    static let shared = RealTimeSearch()
    
    func searchQuery(request: URLRequest, success: @escaping (_ json: Any) -> Void)  {
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print(error!)
            } else {
                success(try! JSONSerialization.jsonObject(with: data!, options: []))
                
            }
        }
        task.resume()
    }
    
    func searchRequestMaker(userCredentials: Any, url: URL, success: @escaping (_ response: Any) -> Void)  {
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        request.setValue("Basic \(userCredentials)", forHTTPHeaderField: "Authorization")
        request.setValue("application/vnd.github.v3+json", forHTTPHeaderField: "Accept")
        searchQuery(request: request, success:{ (json) in
            success(json)
        })
    }
}
