![Demo](https://github.com/iMazy/XMAlertSheetController/blob/master/XMAlertSheetController/demo.png)

XMAlertSheetController is a Swift library that provides a custom action sheet.  

It will give the users a fancy experience without taking pains coding the cool animation.  
Hokusai is compatible with Swift4.

## Requirements

- iOS 10.0+
- Swift 4.2+

## Installation

Drop in the Classes folder to your Xcode project.  
You can also use cocoapods or Carthage.

#### Using [cocoapods](http://cocoapods.org/)

Add `pod 'XMAlertSheetController'` to your `Podfile` and run `pod install`. Also add `use_frameworks!` to the `Podfile`.

```
use_frameworks!
pod 'XMAlertSheetController'
```

#### Using [Carthage](https://github.com/Carthage/Carthage)

Add `github "iMazy/XMAlertSheetController"` to your `Cartfile` and run `carthage update`. If unfamiliar with Carthage then checkout their [Getting Started section](https://github.com/Carthage/Carthage#getting-started).

```
github "iMazy/XMAlertSheetController"
```

## XMAlertSheetController Usage
Import XMAlertSheetController ```import XMAlertSheetController``` then use the following codes in some function except for viewDidLoad.  

```
let alertSheet = XMAlertSheetController(title: "MainTitle", message: "A short description...")

// Add a button with a closure
alertSheet.addAction(XMAlertAction(title: "No Thanks", style: .default, action: {
    // do some thing with defalt action                
}))
 
alertSheet.addAction(XMAlertAction(title: "Allow", style: .destructive, action: {
    // do some thing with destructive action                
}))

// Add a callback for cancel button (Optional)
alertSheet.addAction(XMAlertAction(title: "Cancel", style: .cancel))

// Show Hokusai
self.present(alertSheet, animated: true, completion: nil)
```

#### Add a title and message
```
// Init with title and message 
let alertSheet = XMAlertSheetController(title: Information, message: "This can be a long multi-lined message.")
```

#### Add a button with a closure
```
alertSheet.addAction(XMAlertAction(title: "Button Title", style: .default, action: {
     // Do anything you want
}))
```

## Author
iMazy  
 [http://imazy.cn](http://imazy.cn)
 
## Feedback
Your can feedback me with email mazy_ios@163.com
 
## License
XMAlertSheetController is released under the MIT license.  
See LICENSE for details.
