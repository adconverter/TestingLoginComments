//
//  ViewController.swift
//  AlamofireTest
//
//  Created by Руслан Федорович on 13.05.2018.
//  Copyright © 2018 Руслан Федорович. All rights reserved.
//

import UIKit
import Alamofire
import Unbox
class ViewController: UIViewController {
    
    
    let loginURL = URL(string: "http://fed-blog.herokuapp.com/api/v1/security/login")!
    let commentsURL = URL(string: "http://fed-blog.herokuapp.com/api/v1/comments")!
     let headers = ["Accept": "application/json"]
    
    @IBAction func login(_ sender: Any) {
        
        let name = "admin"
        let password = "1111"
        let parameters = ["name": name, "password": password]
       
        request(loginURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: {responseJSON in
            guard let statusCode = responseJSON.response?.statusCode else { return }
            print("Login statusCode: ", statusCode)
        })
    }
    
    
    @IBAction func commentOn(_ sender: Any) {
        let parameters: [String: Any] = ["text": "commenting on by with code", "idPost": 21, "idUser": 1]
        request(commentsURL, method: .post, parameters: parameters, encoding: JSONEncoding.default).responseJSON(completionHandler: {responseJSON in
            guard let statusCode = responseJSON.response?.statusCode else { return }
            print("Commenting on statusCode: ", statusCode)
        })    }
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
            }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        /// Returns `item` after calling `update` to inspect and possibly
        /// modify it.
        ///
        /// If `T` is a value type, `update` uses an independent copy
        /// of `item`. If `T` is a reference type, `update` uses the
        /// same instance passed in, but it can substitute a different
        /// instance by setting its parameter to a new value.
        
    }
    
    
}

/* let mainURL = URL(string: "http://fed-blog.herokuapp.com/api/v1/posts")!
 let task = URLSession.shared.dataTask(with: mainURL, completionHandler: {(optionalData, response, error) in
 let decoder = JSONDecoder()
 if let data = optionalData, let posts = try? decoder.decode([Post?].self, from: data) {
 for post in posts {
 print(post)
 }
 } else {
 print("data wasn't unwrapped")
 }
 
 })
 task.resume() */
