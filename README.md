# kotlin-native-multiplatform

This project uses Clean Architecture with MVP as presentation archicteture. 
At Presentation, presenters are written in Kotlin and shared between iOS and Android. Views are defined as interface in Kotlin and each platform creates the class that implements those interfaces (iOS: UIViewController, Android: Activity/Fragment). 
Repositories are structured as proxies to Datasources, so both repository and datasource implements the same interface defined in Kotlin. Repository implementation is written in Kotlin and shared between iOS and Android. Datasources are implemented for each platform.
All Domain artifacts are written in Kotlin and shared between iOS and Android. And Entities are defined as a interface so each platform can implement as pleased.

Shared code cannot use specific libraries. Ex.: RxKotlin or Dagger
Dependency Injection for all artifacts (including shared ones) is delegated to each platform.

This project was made with gradle version 4.6.

``` ruby
  sdk install gradle
```

``` ruby
  gradle init
```
