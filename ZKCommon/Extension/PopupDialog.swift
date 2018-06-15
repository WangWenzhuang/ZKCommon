//
//  PopupDialog.swift
//  ZKCommon
//
//  Created by 王文壮 on 2018/5/7.
//  Copyright © 2018年 WangWenzhuang. All rights reserved.
//

import PopupDialog

public extension PopupDialog {
    typealias block = (() -> Void)

    public final class zk {
        public static func show(_ title: String = "提示", message: String) {
            self.show(title, message: message, completion: nil)
        }

        public static func show(_ title: String = "提示", message: String, completion: block?) {
            self.show(title, message: message, buttonTitle: "确定", completion: completion)
        }

        public static func show(_ title: String = "提示", message: String, buttonTitle: String, completion: block?) {
            self.show(title, message: message, otherButtonTitle: buttonTitle, cancelTitle: nil, completion: completion)
        }

        public static func show(_ title: String = "提示", message: String, otherButtonTitle: String, cancelTitle: String?, completion: block?) {
            self.show(title, message: message, otherButtonTitle: otherButtonTitle, cancelTitle: cancelTitle, completion: completion, cancel: nil)
        }

        public static func show(_ title: String = "提示", message: String, otherButtonTitle: String, cancelTitle: String?, completion: block?, cancel: block?) {
            let popup = PopupDialog(title: title, message: message)
            let otherButton = DefaultButton(title: otherButtonTitle, dismissOnTap: true) {
                if completion != nil {
                    completion!()
                }
            }
            if let title = cancelTitle {
                let cancelButton = CancelButton(title: title) {
                    if cancel != nil {
                        cancel!()
                    }
                }
                popup.addButtons([cancelButton, otherButton])
            } else {
                popup.addButtons([otherButton])
            }
            popup.buttonAlignment = .horizontal
            self.topViewController()?.present(popup)
        }

        private static func topViewController(_ vc: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
            if let nav = vc as? UINavigationController {
                return topViewController(nav.visibleViewController)
            }
            if let tab = vc as? UITabBarController {
                return topViewController(tab.selectedViewController)
            }
            if let presented = vc?.presentedViewController {
                return topViewController(presented)
            }
            return vc
        }
    }
}
