# NavigationView

[![CI Status](https://img.shields.io/travis/cpcoder/NavigationView.svg?style=flat)](https://travis-ci.org/cpcoder/NavigationView)
[![Version](https://img.shields.io/cocoapods/v/NavigationView.svg?style=flat)](https://cocoapods.org/pods/NavigationView)
[![License](https://img.shields.io/cocoapods/l/NavigationView.svg?style=flat)](https://cocoapods.org/pods/NavigationView)
[![Platform](https://img.shields.io/cocoapods/p/NavigationView.svg?style=flat)](https://cocoapods.org/pods/NavigationView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

NavigationView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'NavigationView'
```

## Usage

### 配置导航条
```swift
NavigationManager.shared.configNavigation { (config) in
    // 非必须, 默认black
    config.titleColor = .red
    // 必须
    config.backImgName = "nav_btn_close_pre"
    // 非必须, 默认UIFont.systemFont(ofSize: 15, weight: .medium)
    config.titleFont = .systemFont(ofSize: 20, weight: .bold)
}
```
### 初始化导航控制器
```swift
window = UIWindow(frame: UIScreen.main.bounds)
window?.backgroundColor = .white
//注意: 使用NavigationController初始化
window?.rootViewController = NavigationController(rootViewController: AViewController())
window?.makeKeyAndVisible()
```

### 控制器中导航条设置
#### 导航条默认没有底部线条, 如果需要, 用变量接收
 #### 1. 导航条控件设置:
 #### a: 设置有标题的导航
```swift
// 此方法返回一个UIButton对象, 可用变量接收后添加自定义编辑
title("AViewController")
```
#### b: 设置没有标题的导航
```swift
// 此方法返回一个UIButton对象, 可用变量接收后添加自定义编辑
title("")
```
#### 或者
```swift
addNavigationView()
// 此方法返回一个NavigationView对象, 可用变量接收后添加自定义控件
let naviView = addNavigationView()
naviView.backgroundColor = .red
```
#### 2. 左侧返回按钮的展示
#### a: 正常返回按钮
```swift
// 此方法返回一个UIButton对象, 可用变量接收后添加自定义编辑
showBackButton()
```
#### b: 当前页面自定义返回按钮, 比如 模态一个NavigationController, 左上角返回按钮icon可能是X
```swift
// 以下两种方法效果相同
// 区别: 
// 方法1会如果不传参数会使用导航条配置中的返回按钮icon
// 1.使用返回按钮的方法
// 此方法返回一个UIButton对象, 可用变量接收后添加自定义编辑
showBackButton(image: UIImage(named: "ex_image_name"))
// 2.或者使用左侧按钮的方法
// 此方法返回一个UIButton对象, 可用变量接收后添加自定义编辑
showLeftButton(image: UIImage(named: "ex_image_name"))
```
#### 补充: 返回(左侧)按钮的事件, 按需重写
```swift
override func popViewController() {
    super.popViewController()
    // 返回事件里添加自己的代码
}
```

#### 3. 有侧返回按钮的展示
#### 需要手动添加回调事件方法
```swift
// 右侧按钮是一个icon
let rightImgBtn = addRightBtn(image: UIImage(named: "ex_image_name"))
rightImgBtn.addTarget(self, action: #selector(rightBtnAction), for: .touchUpInside)
// 右侧按钮仅文本
let rightTitleBtn = addRightBtn(title: "右侧按钮")
rightImgBtn.addTarget(self, action: #selector(rightBtnAction), for: .touchUpInside)

// 注意: 以上两种均返回UIButton对象, 接收后可设置属性
```

### 布局
#### 添加了导航条之后, 当前ViewController的view 是全屏的
#### 故要在ViewController的View子控件布局顶部要留出导航条的高度
#### 附上导航条准确高度定义, 包含刘海屏+非刘海屏
```swift
/// 状态栏高度
let StatusBarHeight: CGFloat = UIApplication.shared.statusBarFrame.size.height
/// 导航栏高度: 状态栏高度 + 44
let NavigationHeight: CGFloat = StatusBarHeight + 44
```
#### 布局示例demo
```swift
// 使用SnapKit布局
// top.equalTo(NavigationHeight) 留出导航条的高度
view.addSubview(iMainTb)
iMainTb.snp.makeConstraints { (make) in
    make.top.equalTo(NavigationHeight)
    make.left.right.bottom.equalToSuperview()
}
```
```swift
// 使用CGRect布局
// y: 导航条高度, 留出导航条的高度
iMainTb.frame = CGRect(x: 0,
                       y: NavigationHeight,
                       width: UIScreen.main.bounds.width,
                       height: UIScreen.main.bounds.height - NavigationHeight)
```

### 导航条上的重新布局
#### 如果导航条的的控件设计比较花哨, 那么:
```swift
// 返回NavigationView对象, 实际是UIView
let naviView = navigationView()
// 更改导航条背景色
naviView.backgroundColor = .red
// 添加子控件
naviView.addSubview(subView)
```



## Author

cpcoder, chaopeng_coder@qq.com

## License

NavigationView is available under the MIT license. See the LICENSE file for more info.
