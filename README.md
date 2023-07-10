# FieldDay SwiftUI

## Prepare your FieldDay project

-   Open your project in FieldDay. Make sure you have trained atleast one model in the project.
-   Hit the share button at the top right corner of the screen
-   Select the CoreML option
-   Click "Publish Project"
-   Copy the alphanumeric Project Key that appears


## Xcode Project

-   Create Xcode Project
-   Add the FieldDaySwiftUI Package (See Install the SDK)
-   Provide Camera Usage Description
    -   Project > Build Settings
    -   Scroll to Info.plist Values
    -   Find "Privacy - Camera Usage Description"
    -   Provide a suitable description of why you wish to access the Camera
-   [Optional] Lock the supported screen orientations
    -   Target > General > Deployment Info
    -   iPhone Orientation
    -   Check only Portrait

## Setup the FieldDay Viewfinder in your SwiftUI view

-   In the SwiftUI View, import FieldDaySwiftUI
-   In the body of your view, setup the viewfinder

```
ViewfinderView(
    projectKey: "________________________________"
    // Enter the Project Key that we copied from FieldDay
)
```
    
## Add functionality based on predictions

At the moment, the Viewfinder can provide you with predictions in two situations.
-   When the model makes a prediction
-   When the UI element for a prediction is tapped (this is the pill at the bottom of the screen, with the category name for the prediction) 

This information can be accessed via the `onPrediction` and `onPredictionTap` modifiers on the ViewfinderView. The can be used as follows.

```
ViewfinderView(
    projectKey: "________________________________"
)
    .onPrediction(perform: { modelPrediction, category in
        print(category.name, modelPrediction.confidence, category.color)
    })
    .onPredictionTap(perform: { category in
        print(category.name)
        // Add custom logic such as presenting a sheet with information about the category.
    })
```

The `Category` type has the following properties:
- `id`: `String`
- `name`: `String`
- `color`: `Color`
- `isBackground`: `Bool`

The `ModelPrediction` type has the following properties:
- `identifier`: `String`
- `confidence`: `Float`
- `results`: `[VNClassificationObservation]` // contains confidence values for all categories in the model

## Updates to the Project

You may make changes to your project, including adding data , updating the model, and creating new categories. 
When you app launches and accesses your project via the Project Key, any changes will also be fetched. The package caches the project information, so it may take a few tries for the latest information to appear.  

## Install the SDK

You can add FieldDaySwiftUI to an Xcode project by adding it as a package dependency.

-   From the File menu, select Add Packages...
-   Enter "http://github.com/fieldday-ai/fieldday-swiftui" into the package repository URL text field
