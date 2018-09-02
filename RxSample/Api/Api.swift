//
//  Api.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/02.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Moya

extension String {
    var urlEscaped: String {
        return addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!
    }
}

enum Github {
    case userProfile(String)
}

extension Github: TargetType {
    var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    var path: String {
        switch self {
        case .userProfile(let name):
            return "/users/\(name.urlEscaped)"
        }
    }
    
    var method: Method {
        return .get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .userProfile(_):
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return nil
    }    
}
