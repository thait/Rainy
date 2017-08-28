//
//  Constants.swift
//  Rainy
//
//  Created by Thaidev on 8/25/17.
//  Copyright © 2017 vinalab. All rights reserved.
//

import Foundation

let BASE_URL = "http://api.openweathermap.org/data/2.5/weather?"
let LATITUDE = "lat="
let LONGITUDE = "&lon="
let APP_ID = "&appid="
let API_KEY = "55e494694453029bb4b93d720e00a6f1"
let CURRENT_WEATHER_URL = "\(BASE_URL)\(LATITUDE)35\(LONGITUDE)139\(APP_ID)\(API_KEY)"

typealias DownloadComplete = ()->()
