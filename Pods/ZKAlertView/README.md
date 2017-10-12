# ZKAlertViewSwift

![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)
![build](https://travis-ci.org/WangWenzhuang/ZKAlertViewSwift.svg?branch=master)
![CocoaPods](https://img.shields.io/badge/pod-v1.1-brightgreen.svg)
![platform](https://img.shields.io/badge/platform-iOS-brightgreen.svg)

ZKAlertViewSwift 封装了 UIAlertView，简单易用，Block 回调，丢掉各种 tag。

## 特点

*	显示一个按钮，没有 Block 回调，主要用于提示信息

*	显示一个按钮，包含 Block 回调

*	显示多个按钮，包含 Block 回调

## 安装

### CocoaPods

```pod 'ZKAlertViewSwift'```

## 快速使用

### Swift:

```swift
import ZKAlertViewSwift
```

```swift
  ZKAlertViewSwift.showAlertView(
  	title: "ZKAlertView",
  	message: "封装 UIAlertView，简单易用",
  	clickAtIndexBlock: { (alertView, buttonIndex) in print("索引：\(buttonIndex)") }, 
  	cancleButtonTitle: "取消", 
  	otherButtonTitles: "按钮1", "按钮2")
```

## 运行环境
- iOS 8+
- 支持 armv7/armv7s/arm64
