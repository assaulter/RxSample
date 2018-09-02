//
//  GithubApiTargetType.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/02.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Moya

protocol GithubApiTargetType: TargetType {
    associatedtype Response: Codable
}

// GithubApiTargetTypeにデフォルト実装を与える
extension GithubApiTargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var sampleData: Data {
        return Data()
    }
}
