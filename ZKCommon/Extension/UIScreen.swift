//
//  UIScreen.swift
//  ZKCommon
//
//  Created by 王文壮 on 2018/6/22.
//  Copyright © 2018 WangWenzhuang. All rights reserved.
//

import UIKit

public extension UIScreen {
    final class zk {
        /// ZK: width
        static var width: CGFloat {
            return UIScreen.main.bounds.size.width
        }
        /// ZK: height
        static var height: CGFloat {
            return UIScreen.main.bounds.size.height
        }
    }
}
