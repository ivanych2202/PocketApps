//
//  MiniAppsViewController.swift
//  PocketApps
//
//  Created by Ivan Elonov on 07.09.2024.
//

import UIKit
import WeatherMiniApp
import CalculatorMiniApp
import NotesMiniApp

class MiniAppsViewController: UIViewController {
    
    @IBOutlet weak var miniAppsTableView: UITableView!
    
    let miniApps = [
        MiniApp(name: "Погода", imageName: "weatherIcon", previewImageName: "WeatherPreview"),
        MiniApp(name: "Заметки", imageName: "notesIcon", previewImageName: "NotesPreview"),
        MiniApp(name: "Калькулятор", imageName: "calculatorIcon", previewImageName: "CalculatorPreview")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        miniAppsTableView.delegate = self
        miniAppsTableView.dataSource = self
        miniAppsTableView.register(MiniAppCell.self, forCellReuseIdentifier: "MiniAppCell")
    }
    
}

extension MiniAppsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return max(miniApps.count, 10)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MiniAppCell", for: indexPath) as! MiniAppCell
        let miniApp = miniApps[indexPath.row % miniApps.count]
        cell.configure(with: miniApp)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UIScreen.main.bounds.height / 2
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let miniApp = miniApps[indexPath.row % miniApps.count]
        presentMiniApp(miniApp)
    }
    
    private func presentMiniApp(_ miniApp: MiniApp) {
        var viewControllerToPresent: UIViewController
        
        switch miniApp.name {
        case "Погода":
            viewControllerToPresent = WeatherViewController()
        case "Калькулятор":
            viewControllerToPresent = CalculatorMiniApp.createViewController()
        case "Заметки":
            viewControllerToPresent = NotesMiniApp.createViewController()
        default:
            return
        }
        
        viewControllerToPresent.modalPresentationStyle = .fullScreen
        present(viewControllerToPresent, animated: true, completion: nil)
    }
}
