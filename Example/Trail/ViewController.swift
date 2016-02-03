//
//  ViewController.swift
//  Trail
//
//  Created by Giuseppe Basile on 02/02/2016.
//  Copyright (c) 2016 Giuseppe Basile. All rights reserved.
//

import UIKit
import Trail

class ViewController: UIViewController {
  override func viewDidAppear(animated: Bool) {
    super.viewDidAppear(animated)
    
    let request = TrailRequest(path: "https://httpbin.org/get", method: .GET) { (result) -> Void in
      switch result {
      case .Success(_):
        print("Successfull call")
      case .Failure(let error):
        print("Error: \(error)")
      }
    }
    
    Trail.request(request)
    Trail.request(UserAgentRequest(callback: { (result) -> Void in
      switch result {
      case .Success(let data):
        print("User Agent \(data)")
      case .Failure(let error):
        print("Error: \(error)")
      }
    }))
  }
}

