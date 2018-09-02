//
//  QiitaApiTargetType.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/02.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Moya

protocol QiitaApiTargetType: TargetType {
    associatedtype Response: Codable
}

// GithubApiTargetTypeにデフォルト実装を与える
extension QiitaApiTargetType {
    var baseURL: URL {
        return URL(string: "https://qiita.com/api/v2")!
    }
    
    var sampleData: Data {
        return Data()
    }
}
