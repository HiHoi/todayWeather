//
//  WeatherService.swift
//  weatherApp
//
//  Created by Hosung Lim on 2022/09/05.
//

import Foundation
import CoreLocation

//error
enum NetworkError : Error {
    case badURL
    case noData
    case decodingError
}

class WeatherService {
    private var apiKey: String {
        get {
            guard let filePath = Bundle.main.path(forResource: "weatherApi", ofType: "plist") else { fatalError("Couldn't find file.")
            }
            let plist = NSDictionary(contentsOfFile: filePath)
            
            guard let value = plist?.object(forKey: "OPENWEATHERAPI_KEY") as? String else { fatalError("I can't find my key...where...")
            }
            return value
        }
    }
       //lat=\(latitude)&lon=\(longitude)
    func getWeather(completion: @escaping (Result<WeatherResponse, NetworkError>)->Void) {
        let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?&q=seoul&appid=\(apiKey)&units=metric")
        guard let url = url else {
            return completion(.failure(.badURL))
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.noData))
            }
            
            let weatherResponse = try? JSONDecoder().decode(WeatherResponse.self, from: data)
            
            if let weatherResponse = weatherResponse {
                print(weatherResponse)
                completion(.success(weatherResponse))
            } else {
                completion(.failure(.decodingError))
            }
        }.resume()
        
    }
}

