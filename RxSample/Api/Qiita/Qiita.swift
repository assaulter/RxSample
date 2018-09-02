//
//  Qiita.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/02.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Moya

enum Qiita {
    struct GetUserItems: QiitaApiTargetType {
        typealias Response = [QiitaUserItem]
        
        var path: String {
            return "/users/\(name.urlEscaped)/items"
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
