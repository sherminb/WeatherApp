//
//  WeatherCell.swift
//  WeatherApp
//
//  Created by Kuala on 2017-04-12.
//  Copyright © 2017 Litroom. All rights reserved.
//

import UIKit

class WeatherCell: UITableViewCell {

    @IBOutlet weak var thumbImage: UIImageView!
 
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherTypeLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    
    @IBOutlet weak var maxTempLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func loadData(data:FutureWeatherData){
        dayLabel.text = data.date
        weatherTypeLabel.text = data.weatherType
        minTempLabel.text = "\(data.minTemp) C"
        maxTempLabel.text = "\(data.maxTemp) C"
        thumbImage.image = UIImage(named:data.weatherType)
        
    }

}
