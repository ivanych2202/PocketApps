//
//  MiniAppsViewController.swift
//  PocketApps
//
//  Created by Ivan Elonov on 07.09.2024.
//

import UIKit
import WeatherMiniApp
import CalculatorMiniApp

class MiniAppsViewController: UIViewController {
    
    @IBOutlet weak var miniAppsTableView: UITableView!
    
    let miniApps = ["Погода", "Заметки","Калькулятор"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        miniAppsTableView.delegate = self
        miniAppsTableView.dataSource = self 
    }
    
}

extension MiniAppsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return max(miniApps.count, 10)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: nil)
        let miniApp = miniApps[indexPath.row % miniApps.count]
        cell.textLabel?.text = miniApp
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let miniApp = miniApps[indexPath.row % miniApps.count]
        if miniApp == "Погода" {
            let weatherVC = WeatherViewController()
            weatherVC.modalPresentationStyle = .fullScreen
            present(weatherVC, animated: true, completion: nil)
            
        } else if miniApp == "Калькулятор" {
            let calculatorVC = CalculatorMiniApp.createViewController()
            calculatorVC.modalPresentationStyle = .fullScreen
            present(calculatorVC, animated: true, completion: nil)
        }
    }
    
    
}

