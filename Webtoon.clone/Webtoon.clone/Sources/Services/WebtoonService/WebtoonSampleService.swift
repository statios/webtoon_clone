//
//  WebtoonSampleService.swift
//  Webtoon.clone
//
//  Created by Stat.So on 2020/11/14.
//

import Moya
import RxSwift
import Alamofire
import Foundation
import RxMoya

class WebtoonSampleService: BaseService, WebtoonServiceType {
  let provider = NetworkProvider<WebtoonAPI>(
    stubClosure: MoyaProvider.immediatelyStub) //Always call sample data
}
