//
//  ViewController.swift
//  weatherApp
//
//  Created by Hosung Lim on 2022/08/30.
//

import UIKit

class ViewController: UIViewController {
    
    
    let titleLabel : UILabel = {
        
        let label = UILabel()
        label.text = "오늘 날씨에는 뭐입지?"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.textColor = .black
        
        return label
    }()
    
    let weatherImage : UIImageView = {
       
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.image = UIImage(named: "sunny")
        
        return imageView
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        
        
        
        view.addSubview(weatherImage)
        weatherImage.translatesAutoresizingMaskIntoConstraints = false
        weatherImage.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        weatherImage.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        

    }


}

