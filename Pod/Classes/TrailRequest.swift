//
//  TrailRequest.swift
//  Pods
//
//  Created by Giuseppe Basile on 03/02/2016.
//
//

import Foundation
import Alamofire

// Callback for Trail Request
public typealias TrailCallback = (result: Result<AnyObject, NSError>) -> Void

public class TrailRequest {
  public let path: String
  public let method: Alamofire.Method
  public var parameters: Dictionary<String, AnyObject>?
  public var callback: TrailCallback
  
  public init(path: String, method: Alamofire.Method, callback: TrailCallback) {
    self.path = path
    self.callback = callback
    self.method = method
  }
  
  public convenience init(path: String, method: Alamofire.Method, parameters: Dictionary<String, AnyObject>, callback: TrailCallback) {
    self.init(path: path, method: method, callback:callback)
    
    self.parameters = parameters
  }
}
