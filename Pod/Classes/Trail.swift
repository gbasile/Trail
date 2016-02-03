//
//  Trail.swift
//  Pods
//
//  Created by Giuseppe Basile on 03/02/2016.
//
//

import Foundation
import Alamofire

public class Trail {
  public static func request(request: TrailRequest) {
    Alamofire.request(request.method, request.path, parameters: request.parameters, encoding: .JSON, headers: nil).responseJSON { (response) -> Void in
      switch response.result {
      case .Success(let value):
        request.callback(result: Result.Success(value))
      case .Failure(let error):
        request.callback(result: Result.Failure(error))
      }
    }
  }
}

internal func convertResponseToResult(response: NSHTTPURLResponse?, data: NSData?, error: NSError?) ->
  Result<AnyObject, NSError> {
    switch (response, data, error) {
    case let (.Some(_), .Some(data), .None):
      return .Success(data)
    case let (_, _, .Some(error)):
      return Result.Failure(error)
    default:
      let error = NSError(domain: TrailErrorDomain, code: TrailErrorCode.UnknownError.rawValue, userInfo: nil)
      return Result.Failure(error)
    }
}