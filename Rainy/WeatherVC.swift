//
//  ViewController.swift
//  Rainy
//
//  Created by Thaidev on 8/24/17.
//  Copyright © 2017 vinalab. All rights reserved.
//

import UIKit


class WeatherVC : UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    
    @IBOutlet weak var dateLable: UILabel!
    
    @IBOutlet weak var tempLable: UILabel!
    
    @IBOutlet weak var locationLabel: UILabel!
    
    @IBOutlet weak var weatherImage: UIImageView!
    
    @IBOutlet weak var weatherTypeLabel: UILabel!
    
    var currentWeather = CurrentWeather()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        currentWeather.downloadWeatherDetails(competed: {
            self.updateMainUI()
            print("Completed.")
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath)
        return cell
    }
    
    func updateMainUI() {
        dateLable.text = currentWeather.date
        tempLable.text = String(currentWeather.currentTemp)
        locationLabel.text = currentWeather.cityName
        weatherTypeLabel.text = currentWeather.weatherType
        weatherImage.image = UIImage(named: currentWeather.weatherType)
    }

}

