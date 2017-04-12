//
//  CurrentWeatherData.swift
//  WeatherApp
//
//  Created by Kuala on 2017-04-11.
//  Copyright © 2017 Litroom. All rights reserved.
//

import UIKit
import Alamofire

class CurrentWeatherData{
    
    var _cityName:String!
    var _weatherType:String!
    var _temperature:Double!
    var _date:String!
    
    var cityName:String{
        if _cityName == nil{
            _cityName = ""
        }
        return _cityName
    }
    var weatherType:String{
        if _weatherType == nil{
             _weatherType = ""
        }
        return _weatherType
    }
    var temperature:Double{
        if _temperature == nil{
            _temperature = 0
        }
        return _temperature
    }
    var date:String{
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        let today = dateFormatter.string(from: Date())
        self._date = "Today,\(today)"
        return _date
        
    }
    func getCurrentWeatherData(completed: @escaping CompletedCallback){
        Alamofire.request(currentUrl).responseJSON{response in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let cityName = dict["name"] as? String{
                    self._cityName = cityName
                }
                if let weatherData = dict["weather"] as? [Dictionary<String,AnyObject>]{
                    
                    if let weatherType=weatherData[0]["main"] as? String {
                    self._weatherType = weatherType.capitalized
                    
                    }
                }
                if let weatherData = dict["main"] as? Dictionary<String,AnyObject>, let temp=weatherData["temp"] as? Double {
                    self._temperature = temp
                    
                }
            }
            completed()
        }
    }
}
