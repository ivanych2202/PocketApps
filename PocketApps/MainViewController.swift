//
//  ViewController.swift
//  PocketApps
//
//  Created by Ivan Elonov on 06.09.2024.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var allMiniAppsTableView: UITableView!
    
    let miniApps = ["Погода", "Заметки","Калькулятор"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        allMiniAppsTableView.delegate = self
        allMiniAppsTableView.dataSource = self
        
    }

}

extension MainViewController: UITableViewDelegate, UITableViewDataSource {
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
        return UIScreen.main.bounds.height / 8
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "MainToAppsListSegue", sender: self)
    }
    
}
