# ChromaKit

ChromaKit adds convenience API for `SwiftUI.Color`, `UIKit.UIColor` and `AppKit.NSColor` that lets you easily create colours in the Lch, Lab, Oklch, and Oklab colour spaces.

The colour transformations are based on [CSS Color Module Level 4]([url](https://www.w3.org/TR/css-color-4/)https://www.w3.org/TR/css-color-4/) sample code, and so should closely match what you see in most browsers.

## Usage

Use the static functions on the `Color`, `UIColor`, or `NSColor`:

```swift
import ChromaKit

let lch = Color.lch(80, 80, 80)
let lab = Color.lab(80, 13.89, 78.78)
let oklch = UIColor.oklch(0.833, 0.168, 80.115)
let oklab = NSColor.oklab(0.833, 0.029, 0.165)
```

## Installation

### SPM

To use ChromaKit in your SPM package, add it as a dependency to your `Package.swift`:

```
.package(url: "https://github.com/HarshilShah/ChromaKit")
```

And include ChromaKit as a dependency for your target:

```
.product(name: "ChromaKit", package: "ChromaKit")
```

### Xcode Project

To use ChromaKit in your Xcode project, select `File > Add Packages` in Xcode, and enter the URL for this repository in the search field:

```
https://github.com/HarshilShah/ChromaKit
```
