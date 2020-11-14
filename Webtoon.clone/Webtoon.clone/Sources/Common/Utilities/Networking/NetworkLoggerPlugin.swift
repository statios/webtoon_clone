//
//  NetworkLoggerPlugin.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Foundation
import Moya

final class NetworkLoggerPlugin: PluginType {
  func willSend(_ request: RequestType, target: TargetType) {
    #if DEBUG
    let url = request.request?.url?.absoluteString ?? ""
    let header = request.request?.allHTTPHeaderFields ?? [:]
    let bodyData = request.request?.httpBody ?? Data()
    let body = String(bytes: bodyData, encoding: .utf8) ?? ""
    let log = """
    Request
    URL : \(url)
    TARGET : \(target)
    HEADER : \(header)
    BODY : \(body)
    """
    Log.info(log)
    #endif
  }
  
  func didReceive(_ result: Result<Response, MoyaError>, target: TargetType) {
    #if DEBUG
    switch result {
    case .success(let response):
      let request = response.request
      let url = request?.url?.absoluteString ?? ""
      let statusCode = response.statusCode
      let responseData = String(bytes: response.data, encoding: .utf8) ?? ""
      let log = """
      Response: success
      URL : \(url)
      TARGET : \(target)
      STATUS CODE : \(statusCode)
      RESPONSE DATA : \(responseData)
      """
      Log.info(log)
      
    case .failure(let error):
      let statusCode = error.errorCode
      let reason = error.failureReason ?? error.errorDescription ?? "unknown error"
      let log = """
      Response: failure
      TARGET : \(target)
      STATUS CODE : \(statusCode)
      ERROR REASON : \(reason)
      """
      Log.warning(log)
    }
    #endif
  }
}
