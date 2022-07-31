# backyard_hacks

![template](https://user-images.githubusercontent.com/57076552/182029785-90904944-547c-45c8-bbe2-5c7297eeebf5.png)

## TO RUN
Install flutter: https://docs.flutter.dev/get-started/install. 
Download this repo.
Setup a valid device/emulator.
Run:
```
flutter run
```

## Inspiration
Air is vital to our very health, yet, in our daily lives, how often do we think about what enters our lungs? Or how about how the air quality of our city changes each day or week due to urbanization activities unbeknownst to us? Short-term and long-term exposure to air pollutants cause serious health problems, such as respiratory disease, heart disease, and even cognitive decline risks. Yet for such a present problem, we haven't yet embedded a solution to allow people to remember to stay aware about the environment. As such, we decided to build a mobile app to provide the people with knowledge they need to protect their health. With a few easy taps, anyone can check data about air quality in their city . With this kind of solution, we aim to make environmental awareness a priority and as part of normal routine.

## What it does
When a user opens the mobile app, they are greeted with an interactive map that displays markers on major cities in the U.S. The user can then tap on any one of the cities, and they are directed to a page that shows live air quality data about that city. Included in the visualized, easy-to-understand information is the city's Air Quality Index (AQI), the exact time that that measurement was updated, and weekly forecasts for ozone (O3), PM2.5, and PM10 levels, represented as animated bar graphs (O3 is also called smog and is the result of pollutants emitted by cars, power plants, etc react in the presence of sunlight; particulate matter (PM) consists of various chemicals, with PM2.5 accounting for most health effect due to air pollution in the U.S., according to the U.S. Global Change Research Program.) The app also indicates to the user if the AQI is high and warrants concern. On this page, the app provides a suggestion to seek additional resources from regulatory bodies. When a user taps on this button, they are provided information about the EPA and US.gov, which both offer contacts for people to report environmental violations and concerns. The user can easily navigate screen to screen, allowing for an intuitive user interface and experience.   

## How we built it
The app was built using Flutter, an open source framework for building natively compiled, multi-platform applications, and Dart, a language optimized for fast, multi-platform apps. The app uses the World Air Quality Project API, which allows us to make instantaneous requests to fetch from the real-time, geolocalized air quality data feed. The app also uses the Mapbox Datasets API, which has continuously updated data-based map tilesets and data-driven styling through Mapbox GL JS. We customized our own tileset. We primarily chose these APIs for this project because of their data accuracy and real-time updates. We also used the Android Studio SDK and Visual Studio Code.

## Challenges we ran into
Of course, time constraints limit how much additional functionality we are able to build out, and so we focused on optimizing the core aspects. Part of the challenge was also deciding what the finalized UI layout should look like in <1 day.

## Accomplishments that we're proud of
We are immensely proud of bringing this hackathon project from start to (near) finish. We were glad to be able to successfully accomplish the setup for device emulators, API access, and debugging tools. 

## What we learned
This was one of our team member's first time using Flutter and Dart, and the other's second time! We had to learn how to leverage the widget library and UI frameworks. Moreover, it was one of our team member's first time using Github (they created a Github account for this hackathon!). They learned basic git commands and how to collaborate to a repository. For the other member, they learned how to integrate Mapbox into their app and manage synchronicity/asynchronicity. 

## What's next for AQEye
We plan to scale the range of cities we provide data on, making it a global solution. We plan to add notification system as well.
