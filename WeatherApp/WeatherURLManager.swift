//
//  WeatherURLManager.swift
//  WeatherApp
//
//  Created by otet_tud on 1/17/20.
//  Copyright © 2020 otet_tud. All rights reserved.
//

import Foundation

class WeatherURLManager {
    class func getCityWeatherURL(city: String) -> URL? {
        let city = city.replacingOccurrences(of: " ", with: "%20")
        return URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(city)&units=metric&appid=a33a3f7ade37a335ca3315621b88a24a")
    }
    
    class func getWeatherIconURL(iconCode: String) -> URL? {
        return URL(string: "https://openweathermap.org/img/w/\(iconCode).png")
    }
    
    class func getWeatherForecaseURL(city: String) -> URL? {
        let city = city.replacingOccurrences(of: " ", with: "%20")
        return URL(string: "https://api.openweathermap.org/data/2.5/forecast?q=(city)&units=metric&APPID=a33a3f7ade37a335ca3315621b88a24a")
    }
}


        
//        let task = URLSession.shared.dataTask(with: url!) { (data, response, error) in
//            if let error = error {
//                print(error) } else {
//                    // Then we have data
//                if let urlContent = data {
//                    do {
//                        let jSonresult = try JSONSerialization.jsonObject(with: urlContent, options: JSONSerialization.ReadingOptions.mutableContainers) as? NSDictionary
//                        //print(jSonresult)
//                        print(jSonresult?["name"] as! String)
//                        if let description = ((jSonresult?["weather"] as? NSArray)?[0] as? NSDictionary)?["description"] as? String {
//                            print(description)
//
//                            // Call a function to go to main thread to access label
//                            DispatchQueue.main.async {
//                                self.lbl.text = description
//                            }
//                        }
//                    } catch { print(error) }
//                }
//            }
//        }
//        // Start the task
//        task.resume()
//    }
//}
