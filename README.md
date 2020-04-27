# VirtaApp
Sample Virta App with test Api.

# Techniques in use

1. [openapi-generator for swift4](https://github.com/OpenAPITools/openapi-generator/blob/master/docs/generators/swift4.md)
1. [SwiftUI](https://developer.apple.com/xcode/swiftui/)
1. [Combine framework](https://developer.apple.com/documentation/combine)
1. MVVM kind of similar to what is described [here](https://nalexn.github.io/clean-architecture-swiftui/). 
1. CocopaPods for package management

# Build

`pod install`

# Folder structure

Normal folder structure for any CocoaPods project except

1. The generated code to call backend is put in folder `VirtaSdk`.
1. `swagger.yml` contains the SDK definition.
1. `Makefile` which contain single entry for regenration `VirtaSdk` in case `swagger.yml` got changed. 

# Generate SDK

`make generate-sdk`
