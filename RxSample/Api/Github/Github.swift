//
//  GithubApi.swift
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
    struct GetUserProfile: GithubApiTargetType {
        typealias Response = Profile
        
        var path: String {
            return "/users/\(name.urlEscaped)"
        }
        
        var method: Method {
            return .get
        }
        var task: Task {
            return .requestPlain
        }
        var headers: [String : String]? {
            return nil
        }
        let name: String

        init(name: String) {
            self.name = name
        }
    }
}
