//
//  Profile.swift
//  RxSample
//
//  Created by Kazuki Kubo on 2018/09/02.
//  Copyright © 2018年 Kazuki Kubo. All rights reserved.
//

import Foundation

struct Profile: Codable {
    let login: String
    let url: URL
    let name: String?
    let email: String?
}
