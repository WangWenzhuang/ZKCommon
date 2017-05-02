//
//  ZKAlamofireUtility.swift
//  ZKCommon
//
//  Created by 王文壮 on 2017/5/2.
//  Copyright © 2017年 WangWenzhuang. All rights reserved.
//

import Alamofire
import SwiftyJSON
import ZKProgressHUD
import ZKStatusBarNotification

public typealias ZKAlamofireRequestSuccess = (_ json: JSON) -> Void
public typealias ZKAlamofireRequestFailure = () -> Void

public final class ZKAlamofireUtility {
    private static let requestErrorMsg = "连接服务器失败，请稍后再试"
    private static let notNetworkMsg = "没有网络连接，请稍后再试"
    
    private static func request(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure?, method: HTTPMethod,isShowHUD: Bool) {
        if ZKAlamofireUtility.isReachable {
            if isShowHUD {
                ZKProgressHUD.show()
            }
            Alamofire.request(url, method: method, parameters: parameters).responseJSON { (response) in
                if isShowHUD {
                    ZKProgressHUD.dismiss()
                }
                switch response.result {
                case .success(let value):
                    let json = JSON(value)
                    if success != nil {
                        ZKLog.debug((response.request!.url?.absoluteString)! + "\t******\tresponse:\r\(json)")
                        success!(json)
                    }
                case .failure(let error):
                    ZKLog.error((response.request!.url?.absoluteString)! + "\t******\terror:\r\(error)")
                    if failure != nil {
                        failure!()
                    }
                }
            }
        } else {
            ZKStatusBarNotification.showError(notNetworkMsg)
            if failure != nil {
                failure!()
            }
        }
        
    }
    
    /// get
    public static func get(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure?) {
        request(url, parameters: parameters, success: success, failure: failure, method: .get, isShowHUD: false)
    }
    
    /// get
    public static func get(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?) {
        get(url, parameters: parameters, success: success, failure: nil)
    }
    
    /// get 显示 HUD
    public static func getWithShowHUD(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure?) {
        request(url, parameters: parameters, success: success, failure: failure, method: .get, isShowHUD: true)
    }
    
    /// get 显示 HUD
    public static func getWithShowHUD(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?) {
        getWithShowHUD(url, parameters: parameters, success: success, failure: nil)
    }
    
    /// post
    public static func post(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure?) {
        request(url, parameters: parameters, success: success, failure: failure, method: .post, isShowHUD: false)
    }
    
    /// post
    public static func post(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?) {
        post(url, parameters: parameters, success: success, failure: nil)
    }
    
    /// post 显示 HUD
    public static func postWithShowHUD(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?, failure: ZKAlamofireRequestFailure?) {
        request(url, parameters: parameters, success: success, failure: failure, method: .post, isShowHUD: true)
    }
    
    /// post 显示 HUD
    public static func postWithShowHUD(_ url: String, parameters: [String: Any]?, success: ZKAlamofireRequestSuccess?) {
        postWithShowHUD(url, parameters: parameters, success: success, failure: nil)
    }
    
    static private var isStartNetworkMonitoring = false
    static private let networkManager = NetworkReachabilityManager(host: "www.baidu.com")!
    /// 网络监视
    public static func startNetworkMonitoring() {
        networkManager.listener = { status in
            isStartNetworkMonitoring = true
            switch status {
            case .notReachable:
                ZKLog.debug("当前网络状态：notReachable")
            case .unknown:
                ZKLog.debug("当前网络状态：Unknown")
            case .reachable(.ethernetOrWiFi):
                ZKLog.debug("当前网络状态：ReachableViaWiFi")
            case .reachable(.wwan):
                ZKLog.debug("当前网络状态：ReachableViaWWAN")
            }
        }
        networkManager.startListening()
    }
    /// 是否联网
    private static var isReachable: Bool {
        get {
            return networkManager.isReachable
        }
    }
}
