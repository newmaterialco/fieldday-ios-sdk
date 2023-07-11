# FieldDay iOS SDK
![fieldday-header](https://github.com/fieldday-ai/fieldday-ios-sdk/assets/58298401/04c5a285-7729-4615-be33-92804bbd259a)

## Install the SDK

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
### Add the FieldDay Viewfinder to your SwiftUI view

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

The events can be handled via the `onPrediction` and `onPredictionTap` modifiers on the ViewfinderView. They can be used as follows.

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

The `FDCategory` type has the following properties:
- `id`: `String`
- `name`: `String`
- `color`: `Color`
- `isBackground`: `Bool`

The `FDModelPrediction` type has the following properties:
- `identifier`: `String`
- `confidence`: `Float`
- `results`: `[VNClassificationObservation]` // contains confidence values for all categories in the model

## Updates to the Project

You may make changes to your project, including collecting more data, updating the model, and creating new categories. 
When your app launches and accesses your project via the Project Key, any changes will also be fetched. The package caches the project information, so it may take a few tries for the latest information to appear.  
