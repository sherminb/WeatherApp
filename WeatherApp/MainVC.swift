//
//  MainVC.swift
//  WeatherApp
//
//  Created by Kuala on 2017-04-11.
//  Copyright © 2017 Litroom. All rights reserved.
//

import UIKit
import Alamofire

class MainVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var cityName: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var todayDate: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    var currentWeather:CurrentWeatherData!
    var futureWeatherData: [FutureWeatherData] = [FutureWeatherData]()
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        
        tableView.dataSource=self
        tableView.delegate=self
        
        currentWeather = CurrentWeatherData()
        currentWeather.getCurrentWeatherData{
            self.updateTodayWeather()
        }

    }
    func updateTodayWeather(){
        weatherType.text = currentWeather.weatherType
        cityName.text = currentWeather.cityName
        temperature.text = "\(currentWeather.temperature) C"
        todayDate.text = currentWeather.date
        imageView.image=UIImage(named: currentWeather.weatherType)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return futureWeatherData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
    func getForcastWeatherData(completed: @escaping CompletedCallback){
        Alamofire.request(forcastURL).responseJSON{response in
            let result = response.result
            if let dict = result.value as? Dictionary<String,AnyObject>{
                if let dataList = dict["list"] as? [Dictionary<String,AnyObject>]{
                    
                    for dataPoint in dataList{
                        let nextDataPoint = FutureWeatherData(dict: dataPoint)
                        self.futureWeatherData.append(nextDataPoint)
                    }
                }
            }
            
            
            completed()
        }
    }


}

