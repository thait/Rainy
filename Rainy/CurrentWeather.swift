//
//  CurrentWeather.swift
//  Rainy
//
//  Created by Thaidev on 8/26/17.
//  Copyright © 2017 vinalab. All rights reserved.
//

import Foundation
import Alamofire

class CurrentWeather {
    var _cityName: String!
    var _date: String!
    var _weatherType: String!
    var _currentTemp: Double!
    
    var cityName: String{
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    var date: String{
        if _date == nil{
            _date = ""
        }
        let dateFormater = DateFormatter()
        dateFormater.dateStyle = .long
        dateFormater.timeStyle = .none
        let currentDate = dateFormater.string(from: Date())
        _date = "Today, \(currentDate)"
        return _date
    }
    var weatherType: String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    var currentTemp: Double{
        if _currentTemp == nil{
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func downloadWeatherDetails(competed: @escaping DownloadComplete) {
       
        let currentWeatherURL = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherURL).responseJSON { (response) in
            print(CURRENT_WEATHER_URL)
            let result = response.result
            if let dict = result.value as? Dictionary<String , AnyObject>{
                self._cityName = dict["name"] as! String
                print(self._cityName)
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>]
                {
                    self._weatherType = weather[0]["main"] as! String
                    print(self._weatherType)
                }
                if let main = dict["main"] as? Dictionary<String,AnyObject>{
                    if let currentTemp = main["temp"] as? Double{
                        let kevinPreDisvison = (currentTemp * (9/5)-459.67)
                        let kevin = Double(round(10 * kevinPreDisvison/10))
                        self._currentTemp = kevin
                        print(self._currentTemp)
                    }
                }
            }
            competed()
        }
        
    
    
}
}
