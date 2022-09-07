//
//  ViewController.swift
//  weatherApp
//
//  Created by Hosung Lim on 2022/08/30.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    /**경도 위도 추가
    var locationManager : CLLocationManager!
    
    var latitude: Double?
    var longitude: Double?
    */
    
    //날씨 속성
    var weather  : Weather?
    var main : Main?
    var name : String?
    
    //StoryBoard와 연결
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var minTempLabel: UILabel!
    @IBOutlet weak var maxTempLabel: UILabel!
    
    private func setWeatherUI(){
        let url = URL(string: "https://openweathermap.org/img/wn/\(self.weather?.icon ?? "00")@2x.png")
        let data = try? Data(contentsOf: url!)
        if let data = data {
            iconImageView.image = UIImage(data: data)
        }
        tempLabel.text = "\(main!.temp)"
        minTempLabel.text = "\(main!.temp_min)"
        maxTempLabel.text = "\(main!.temp_max)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /**위도 경도
        locationManager = CLLocationManager()
        locationManager.delegate = self
        
        locationManager.requestWhenInUseAuthorization()
        
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        
        locationManager.startUpdatingLocation()
        
        let coor = locationManager.location?.coordinate
        latitude = coor?.latitude
        longitude = coor?.longitude
         */
        //날씨 서비스
        WeatherService().getWeather { result in
            switch result {
            case .success(let weatherResponse) :
                DispatchQueue.main.async {
                    self.weather = weatherResponse.weather.first
                    self.main = weatherResponse.main
                    self.name = weatherResponse.name
                    self.setWeatherUI()
                }
            case .failure(_ ):
                print("error")
            }
        }
    }
}

