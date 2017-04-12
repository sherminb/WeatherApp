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
    var _minTemp: String!
    var _maxTemp: String!
    var _weatherType: String!
    
    var minTemp:String{
        if _minTemp == nil{
            _minTemp = ""
        }
        return _minTemp
    }
    var maxTemp:String{
        if _maxTemp == nil{
            _maxTemp = ""
        }
        return _maxTemp
    }
    var weatherType:String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
}
