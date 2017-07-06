# ZKAlertViewSwift

[![Build Status](https://img.shields.io/badge/build-passing-brightgreen.svg)](https://github.com/WangWenzhuang/ZKAlertViewSwift)
[![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)](https://github.com/WangWenzhuang/ZKAlertViewSwift)
[![CocoaPods](https://img.shields.io/badge/pod-1.0-brightgreen.svg)](https://github.com/WangWenzhuang/ZKAlertViewSwift)
[![platform](https://img.shields.io/badge/platform-iOS-brightgreen.svg)](https://github.com/WangWenzhuang/ZKAlertViewSwift)
[![platform](https://img.shields.io/badge/contact-1020304029%40qq.com-brightgreen.svg)](https://github.com/WangWenzhuang/ZKAlertViewSwift)

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
