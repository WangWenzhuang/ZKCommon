![(logo)](https://raw.githubusercontent.com/WangWenzhuang/ZKAlertView/master/Demo/image%402x.png)

# ZKAlertView

![license](https://img.shields.io/badge/license-MIT-brightgreen.svg)
![build](https://travis-ci.org/WangWenzhuang/ZKAlertView.svg?branch=master)
![CocoaPods](https://img.shields.io/badge/pod-v2.0-brightgreen.svg)
![platform](https://img.shields.io/badge/platform-iOS-brightgreen.svg)

封装了 UIAlertView，简单易用，Block 回调，丢掉各种 tag。

## 实现功能

- [x] 标题选择性显示
- [x] 按钮自定义显示
- [x] 回调

## 运行环境

* iOS 8.0 +
* Xcode 8 +
* Swift 3.0 +

## 安装

### CocoaPods

你可以使用 [CocoaPods](http://cocoapods.org/) 安装 `ZKAlertView`，在你的 `Podfile` 中添加：

```ogdl
platform :ios, '8.0'
use_frameworks!

target 'MyApp' do
    pod 'ZKAlertView'
end
```
### 手动安装

* 拖动 `ZKAlertView` 文件夹到您的项目

## 快速使用

### 导入 `ZKAlertView`

```swift
import ZKAlertView
```

### 不显示标题，显示一个按钮

```swift
ZKAlertView.show(message: "不显示标题，显示一个按钮", buttonTitle: "确定")
```

### 显示标题，显示一个按钮

```swift
ZKAlertView.show("标题", message: "显示标题，显示一个按钮", buttonTitle: "确定")
```

### 不显示标题，显示一个按钮，包含回调

```swift
ZKAlertView.show(message: "不显示标题，显示一个按钮，包含回调", buttonTitle: "确定") {
    print("不显示标题，显示一个按钮，包含回调")
}
```

### 显示标题，显示一个按钮，包含回调

```swift
ZKAlertView.show("标题", message: "显示标题，显示一个按钮，包含回调", buttonTitle: "确定") {
	print("不显示标题，显示一个按钮，包含回调")
}
```

### 不显示标题，显示多个按钮，包含回调

```swift
ZKAlertView.show(message: "不显示标题，显示多个按钮，包含回调", cancleButtonTitle: "取消", otherButtonTitles: "按钮1", "按钮2") { (alertView, buttonIndex) in
	print("按钮点击索引：\(buttonIndex)")
}
```

### 显示标题，显示多个按钮，包含回调

```swift
ZKAlertView.show("标题", message: "显示标题，显示多个按钮，包含回调", cancleButtonTitle: "取消", otherButtonTitles: "按钮1", "按钮2") { (alertView, buttonIndex) in
	print("按钮点击索引：\(buttonIndex)")
}
```