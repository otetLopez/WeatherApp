//
//  CityTableViewCell.swift
//  WeatherApp
//
//  Created by otet_tud on 1/17/20.
//  Copyright © 2020 otet_tud. All rights reserved.
//

import UIKit

class CityTableViewCell: UITableViewCell {
    

    @IBOutlet weak var city: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var iconImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    func setCity(city: String) {
        self.city.text = city
        if let weatherURL = WeatherURLManager.getCityWeatherURL(city: city) {
            let session = URLSession.shared
            // create a task
            let task = session.dataTask(with: weatherURL) { (data, response, error) in
                if data != nil {
                    // load the temp
                    if let weatherData = try? JSON(data: data!) {
                        print(weatherData)
                        let tempValue = weatherData["main"]["temp"].intValue
                        self.loadIcon(weatherData: weatherData)
                        // UI is in main thread
                        DispatchQueue.main.async {
                            self.tempLabel.text = "\(tempValue)"
                        }
                    }
                }
            }
            // start the task
            task.resume()
        }
        
        
        
    }
    func loadIcon(weatherData: JSON) {
        let weatherArray = weatherData["weather"].arrayValue
        let iconCode = weatherArray[0]["icon"].stringValue
        if let iconURL = WeatherURLManager.getWeatherIconURL(iconCode: iconCode) {
            let session = URLSession.shared
            let task = session.dataTask(with: iconURL) { (data, response, error) in
                if let iconData = data {
                    // Update UI
                    DispatchQueue.main.async {
                        self.iconImage.image = UIImage(data: iconData)
                    }
                }
            }
            task.resume()
        }
    }
}
