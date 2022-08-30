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
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true

    }


}

