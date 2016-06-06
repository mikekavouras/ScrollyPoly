# ScrollyPolyView

[![CI Status](http://img.shields.io/travis/Mike Kavouras/ScrollyPolyView.svg?style=flat)](https://travis-ci.org/Mike Kavouras/ScrollyPolyView)
[![Version](https://img.shields.io/cocoapods/v/ScrollyPolyView.svg?style=flat)](http://cocoapods.org/pods/ScrollyPolyView)
[![License](https://img.shields.io/cocoapods/l/ScrollyPolyView.svg?style=flat)](http://cocoapods.org/pods/ScrollyPolyView)
[![Platform](https://img.shields.io/cocoapods/p/ScrollyPolyView.svg?style=flat)](http://cocoapods.org/pods/ScrollyPolyView)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![https://github.com/mikekavouras/ScrollyPolyView/blob/master/assets/scroll.gif](https://github.com/mikekavouras/ScrollyPolyView/blob/master/assets/scroll.gif)

## Installation

ScrollyPolyView is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "ScrollyPolyView"
```

## Usage

```swift
@IBOutlet weak var scrollView: ScrollyPolyView!
@IBOutlet weak var imageView: UIImageView! // the view your masking


lazy var masks: [UIImageView] = {
  let images = [UIImage(named: "cat")!, UIImage(named:"circle")!, UIImage(named: "heart")!]
  let imageViews = images.map { UIImageView(image: $0) }
  return imageViews
}()

override func viewDidLoad() {
  // the important lines
  scrollView.masks = masks
  imageView.layer.mask = scrollView.scrollLayer
    
  super.viewDidLoad()
}
```

## Author

Mike Kavouras

## License

ScrollyPolyView is available under the MIT license. See the LICENSE file for more info.
