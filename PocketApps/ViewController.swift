//
//  ViewController.swift
//  PocketApps
//
//  Created by Ivan Elonov on 06.09.2024.
//

import UIKit
import WeatherMiniApp

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)

        let weatherVC = WeatherViewController()
        weatherVC.modalPresentationStyle = .fullScreen
        present(weatherVC, animated: true, completion: nil)
    }



}

