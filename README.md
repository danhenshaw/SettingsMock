# SettingsMock

SettingsMock shows how you can implement settings features to an app. The inspiration for this project came from my [WeatherApp](https://github.com/danhenshaw/WeatherApp_V2) project so some features such as the Data Point section and option to select forecast measurement units are taken directly from that project.


## Objective

Create an iPhone app that will allow a user to change certain settings, open links, update app privacy settings etc.


## Solution

I have loosely employed the MVVM-C design pattern to complete the construction of this app. With Minimal data required, I did away with the Model for the PickerView as the View Model could play this role and store the array data in the appropriate data models without over engineering the app.

To improve the user experience, i have implemented an alert controller that displays when there has been an error with the opening the mail services and a thank you message to confirm once a e-mail has been sent. 

Visually, I kept the design of the app minimal using grouped table views to display the data in the main screen and then the data point selection screen. The app also features a UIPickerView which is implemented as both a child view in the data point view and as a main view pushed from the main view.

No third party frameworks have been used in the development of this project. 


## Features

    #### The Main screen:
      - The List screen presents an overview of available features within the settings app presented in a table view
      - The app uses Swift's default view cells

    #### The Data Point screen:
      - The Data Point Screen shows a mock view at the top of the screen
      - Below the mock view is a table view which shows each customiseable entry into the data point
      - When a user selects a data point, a UIPickerView is displayed at the bottom of the screen.
      - The Picker View Controller holds a weak reference to the Data Point view controller so can sent information back when a user selects a new value.
      
    #### Picker screen:
      - Simple UIPickerView display various data models such as languages, units, colours or three different data points.


## Author

Daniel Henshaw, danieljhenshaw@gmail.com


## License

BitcoinTracker is available under the [MIT license](https://opensource.org/licenses/MIT)
