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
When a user opens the mobile app, they are greeted with an interactive map that displays markers on major cities in the U.S. The user can then tap on any one of the cities, and they are directed to a page that shows live air quality data about that city. Included in the visualized, easy-to-understand information is the city's Air Quality Index (AQI), the exact time that that measurement was updated, and weekly forecasts for ozone (O3), PM2.5, and PM10 levels, represented as animated bar graphs (O3 is also called smog and is the result of pollutants emitted by cars, power plants, etc react in the presence of sunlight; particulate matter (PM) consists of various chemicals, with PM2.5 accounting for most health effect due to air pollution in the U.S., according to the U.S. Global Change Research Program.) The app also indicates to the user if the AQI is high and warrants concern. On this page, the app provides a suggestion to seek additional resources from regulatory bodies. When a user taps on this button, they are provided information about the EPA and US.gov, which both offer contacts for people to report environmental violations and concerns. The user can easily navigate screen to screen, allowing for an intuitive user interface and experience.   

The app was built using Flutter, an open source framework for building natively compiled, multi-platform applications, and Dart, a language optimized for fast, multi-platform apps. The app uses the World Air Quality Project API, which allows us to make instantaneous requests to fetch from the real-time, geolocalized air quality data feed. The app also uses the Mapbox Datasets API, which has continuously updated data-based map tilesets and data-driven styling through Mapbox GL JS.
