# Weather App

Weather App Flutter project.

## Setup notes
1. Install Flutter on your device.You can follow the official Flutter installation guide: [Flutter Installation](https://docs.flutter.dev/get-started/install).
2. Create a new Flutter project using the Flutter CLI command:
   -     flutter create weather_app
4. Open the project in VS code using command:
   -     code  .
6. Replace the lib file in the project with lib file from my repository.
7. Make a new folder in the project with name assets and upload necessary images to the folder.
8. Update the pubspec.yaml file to include the required dependencies and also add assets:
   -     dependencies:
           flutter:
             sdk: flutter
           http: ^1.1.0
           google_fonts: ^5.1.0
           flutter_spinkit: ^5.2.0
           weather_icons: ^3.0.0
           geolocator: ^9.0.2
           shared_preferences: ^2.2.0
         //
         //
         assets:
            - assets/
 9. Run the following command to download the dependencies:
    -     flutter pub get
10. You can now run the Flutter app on your preferred device or emulator:
    -     flutter run

  


Download the [Weather App](https://drive.google.com/file/d/1zuOpdIFX-As6-2qTLZEVfjSRgTwGK5Sc/view?usp=drive_link).

Share your feedback at dksths2@gmail.com.


A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
