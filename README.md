# FieldDay iOS SDK
![fdsdk](https://github.com/fieldday-ai/fieldday-ios-sdk/assets/58298401/49097712-e46d-4fa8-91b7-28c648f47926)

## Installation

You can add FieldDay iOS SDK using Swift Package Manager.
- From the File menu, select Add Packages...
- Enter the repo's URL
```
http://github.com/fieldday-ai/fieldday-ios-sdk.git
```

## Prepare your FieldDay project

-   Open your project in the FieldDay app. Make sure you have trained at least one model in the project.
-   Tap the share button at the top right corner of the screen.
-   Select the `CoreML` option.
-   Tap "Publish Project".
-   Copy the alphanumeric Project Key that appears.


## Xcode Project

-   Create Xcode Project
-   Add the FieldDay Package (See Install the SDK)
-   Provide Camera Usage Description
    -   Project > Build Settings
    -   Scroll to Info.plist Values
    -   Find "Privacy - Camera Usage Description"
    -   Provide a suitable description of why you wish to access the Camera
-   [Optional] Lock the supported screen orientations
    -   Target > General > Deployment Info
    -   iPhone Orientation
    -   Check only Portrait

## Usage
### Add the FieldDay Viewfinder

-   In the SwiftUI View, import FieldDay
-   In the body of your view, setup the viewfinder

```swift
import SwiftUI
import FieldDay

struct ContentView: View {
    var body: some View {
        FDViewfinderView(
            /// Enter the Project Key that we copied from FieldDay
            projectKey: "________________________________"
        )
    }
}
```
    
### Handle prediction events

At the moment, the FieldDay SDK supports handling the following events:
-   When the model makes a prediction
-   When a prediction pill is tapped

*A prediction pill is the element at the bottom of the screen, showing the category name for the prediction*

These events can be handled via the `onPrediction` and `onPredictionTap` modifiers on the ViewfinderView. They can be used as follows.

```swift
import SwiftUI
import FieldDay

struct ContentView: View {
    var body: some View {
        FDViewfinderView(...)
            .onPredictionTap { category in
                print(category.name)
            }
            .onPrediction { prediction, category in
                print(category.name, prediction.confidence)
            }
    }
}
```

### `FDCategory`
```swift
struct FDCategory {
    var id: String
    var name: String
    var color: Color
    var isBackground: Bool
}
```
- `id` - The unique identifier of the category
- `name` - The category's name (defined in the FieldDay App)
- `color` - The category's color (defined in the FieldDay App)
- `isBackground` - Indicates whether the category is the default "Background" category

### `FDModelPrediction`
```swift
struct FDModelPrediction {
    var identifier: String
    var confidence: Float
    var results: [VNClassificationObservation]
}
```
- `identifier` - The identifier returned associated with the CoreML prediction
- `confidence` - The confidence of the prediction, normalized from `0...1`
- `results` - Contains confidence values for all categories in the model

### Debugging
To view debugging logs that expose error messages for project loading, model loading or model inferencing operations - just add the `.debug` modifier to your FDViewfinderView.
```swift
import SwiftUI
import FieldDay

struct ContentView: View {
    var body: some View {
        FDViewfinderView(...)
            .debug()
    }
}
```

## Updating your FieldDay Project

You may make changes to your project, including collecting more data, updating the model, and creating new categories. 
When your app launches and accesses your project via the Project Key, any changes will also be fetched. The package caches the project information, so it may take a few tries for the latest information to appear.  
