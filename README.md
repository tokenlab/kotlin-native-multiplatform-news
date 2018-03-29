# Kotlin-native-multiplatform

## Description

This is an example of multiplatform Kotlin/Native project. The whole business logic is written in Kotlin and shared between iOS and Android apps.

The project contains the common module named ```common``` and have support for iOS by ```common-ios``` and Android platforms.


## Common module

The common module contains the logic of two use cases:

* Calculator: Kotlin code receives ```x``` and ```y``` values, calculate the sum and returns the result.

* Top articles: receives response request from [News API](https://newsapi.org/), process data and returns the manipulated list of articles.

## Architecture

The project uses Clean Architecture with MVP as presentation archicteture.

* **Presentation**: presenters are written in Kotlin and shared between iOS and Android. Views are defined as interface in Kotlin and each platform creates the class that implements those interfaces (iOS: UIViewController, Android: Activity/Fragment).

* **Repository**: repositories are structured as proxies to Datasources, so both repository and datasource implements the same interface defined in Kotlin. Repository implementation is written in Kotlin and shared between iOS and Android. Datasources are implemented for each platform.  
* **Domain**: all Domain artifacts are written in Kotlin and shared between iOS and Android. And Entities are defined as a interface so each platform can implement as pleased.

Shared code cannot use specific libraries. Ex.: RxKotlin or Dagger.  
Dependency Injection for all artifacts (including shared ones) is delegated to each platform.


## Build and run application

### Requirements

* Gradle version 4.6
* Xcode 9 or higher
* [Carthage](https://github.com/Carthage/Carthage) (used for iOS dependency manager)

### iOS project

The directory ``` applications/ios/NewsApp``` contains the iOS project.   

Run Carthage command to download all iOS dependencies:

``` ruby
  carthage bootstrap --no-use-binaries --platform iOS
```

After that, open ```NewsApp.xcodeproj ``` and build the project.

There is a script in Build Phases that build common Kotlin code generates the ```Common.framework``` that is embedded in the iOS project.
