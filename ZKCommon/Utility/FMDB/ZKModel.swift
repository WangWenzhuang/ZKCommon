//
//  ZKModel.swift
//  ZKCommon
//
//  Created by 王文壮 on 2018/6/12.
//  Copyright © 2018 WangWenzhuang. All rights reserved.
//

import ObjectMapper

public protocol ZKModel: Mappable {
    static var members: [String] { get }
}
