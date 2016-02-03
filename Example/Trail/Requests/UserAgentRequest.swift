//
//  UserAgentRequest.swift
//  Trail
//
//  Created by Giuseppe Basile on 03/02/2016.
//  Copyright © 2016 CocoaPods. All rights reserved.
//

import Trail
import Alamofire

/// This class show how to provide a default parsing of the callback
class UserAgentRequest: TrailRequest {
  convenience init(callback: TrailCallback) {
    
    //Parse the response to directly provide the user agent
    func parsingCallback(result: Result<AnyObject, NSError>) -> Void {
      switch result {
      case .Success(let data):
        if let userAgent = data["user-agent"] as? String {
          callback(result: Result.Success(userAgent))
        } else {
          callback(result: result)
        }
      default:
        callback(result: result)
      }
    }
    
    self.init(path: "https://httpbin.org/user-agent", method: .GET, callback: parsingCallback)
  }
}
