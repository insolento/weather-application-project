import Foundation

let settings = [["Temperature","C","F"],["Wind speed","Mi","Km"],["Time format","12","24"],["Notifications","On","Off"]]

var currentSetting = SettingModel(temperature: "F",windSpeed: "Km",timeFormat: "24",notifications: "Off")

class SettingModel {
    
    var temperature: String
    
    var windSpeed: String
    
    var timeFormat: String
    
    var notifications: String
    
    init(temperature: String, windSpeed: String, timeFormat: String, notifications: String) {
        self.temperature = temperature
        self.windSpeed = windSpeed
        self.timeFormat = timeFormat
        self.notifications = notifications
    }
}
