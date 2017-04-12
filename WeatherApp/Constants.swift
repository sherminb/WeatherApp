//
//  Constants.swift
//  WeatherApp
//
//  Created by Kuala on 2017-04-11.
//  Copyright © 2017 Litroom. All rights reserved.
//

import Foundation

let BASE_URL = "http://samples.openweathermap.org/data/2.5/"
let API_KEY = "a29391c9413f10f2432ae70976895c6c"

let lat = "35"
let lon = "139"
let currentUrl = "\(BASE_URL)weather?lat=\(lat)&lon=\(lon)&appid=\(API_KEY)"
let forcastURL = "\(BASE_URL)forecast/daily?lat=\(lat)&lon=\(lon)&cnt=10&appid=\(API_KEY)"

typealias CompletedCallback = ()->()


