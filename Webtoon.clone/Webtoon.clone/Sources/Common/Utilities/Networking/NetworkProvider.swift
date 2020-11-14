//
//  NetworkProvider.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Moya
import RxSwift
import Alamofire
import Foundation

final class NetworkProvider<Target: TargetType>: MoyaProvider<Target> {

  override init(endpointClosure: @escaping MoyaProvider<Target>.EndpointClosure = MoyaProvider.defaultEndpointMapping,
                requestClosure: @escaping MoyaProvider<Target>.RequestClosure = MoyaProvider<Target>.defaultRequestMapping,
                stubClosure: @escaping MoyaProvider<Target>.StubClosure = MoyaProvider.neverStub,
                callbackQueue: DispatchQueue? = nil,
                session: Session = MoyaProvider<Target>.defaultAlamofireSession(),
                plugins: [PluginType] = [],
                trackInflights: Bool = false) {
    super.init(endpointClosure: endpointClosure,
               requestClosure: requestClosure,
               stubClosure: stubClosure,
               callbackQueue: callbackQueue,
               session: session,
               plugins: [NetworkLoggerPlugin()],
               trackInflights: trackInflights
    )
  }
}

extension PrimitiveSequence where Trait == SingleTrait, Element == Response {
  func showIndicator(_ isShow: Bool) -> Single<Element> {
    guard isShow else { return self }
    return self
      .observeOn(MainScheduler.asyncInstance)
//      .do(onSuccess: { _ in ActivityIndicatorPrsenter.shared.show() })
      .delay(.milliseconds(2000), scheduler: MainScheduler.asyncInstance)
//      .do(onDispose: { ActivityIndicatorPrsenter.shared.hide() })
  }
}
