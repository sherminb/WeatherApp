//
//  futureWeatherData.swift
//  WeatherApp
//
//  Created by Kuala on 2017-04-12.
//  Copyright © 2017 Litroom. All rights reserved.
//

import UIKit
import Alamofire

class FutureWeatherData{
    var _date:String!
    var _minTemp: Double!
    var _maxTemp: Double!
    var _weatherType: String!
    
    var minTemp:Double{
        if _minTemp == nil{
            _minTemp = 0.0
        }
        return _minTemp
    }
    var maxTemp:Double{
        if _maxTemp == nil{
            _maxTemp = 0.0
        }
        return _maxTemp
    }
    var weatherType:String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    var date:String{
        if _date == nil{
            _date = ""
        }
        return _date
    }
    init(dict: Dictionary<String,AnyObject>){
        if let temp=dict["temp"] as? Dictionary<String,AnyObject>{
            if let min=temp["min"] as? Double{
                self._minTemp=min
            }
            if let max=temp["max"] as? Double{
                self._maxTemp=max
            }
        }
        if let weatherData = dict["weather"] as? [Dictionary<String,AnyObject>]{
            
            if let weatherType=weatherData[0]["main"] as? String {
                self._weatherType = weatherType.capitalized
                
            }
        }
        if let dt = dict["dt"] as? Double{
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.timeStyle = .none
            dateFormatter.dateFormat = "EEEE"
            
            let date = Date(timeIntervalSince1970: dt)
            self._date = dateFormatter.string(from: date)
        }
        
        
    }
}
