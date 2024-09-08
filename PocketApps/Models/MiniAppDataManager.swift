//
//  MiniAppDataManager.swift
//  PocketApps
//
//  Created by Ivan Elonov on 08.09.2024.
//

import UIKit

class MiniAppDataManager {
    static let shared = MiniAppDataManager()
    
    private init() {}
    
    let miniApps = [
        MiniApp(name: "Погода", imageName: "weatherIcon"),
        MiniApp(name: "Заметки", imageName: "notesIcon"),
        MiniApp(name: "Калькулятор", imageName: "calculatorIcon")
    ]
    
    func createItemView(for app: MiniApp, yOffset: CGFloat, itemHeight: CGFloat, viewWidth: CGFloat) -> UIView {
        let itemView = UIView(frame: CGRect(x: 0, y: yOffset, width: viewWidth, height: itemHeight))
        
        let iconSize: CGFloat = itemHeight * 0.6
        let iconView = UIImageView(frame: CGRect(x: viewWidth / 2 - iconSize - 10, y: (itemHeight - iconSize) / 2, width: iconSize, height: iconSize))
        
        itemView.backgroundColor = UIColor(red: CGFloat(arc4random()) / 0xFFFFFFFF, green: CGFloat(arc4random()) / 0xFFFFFFFF, blue: CGFloat(arc4random()) / 0xFFFFFFFF, alpha: 0.5)
        
        iconView.image = UIImage(named: app.imageName)
        iconView.contentMode = .scaleAspectFill
        iconView.clipsToBounds = true
        iconView.layer.cornerRadius = iconSize / 2
        iconView.layer.borderWidth = 1
        iconView.layer.borderColor = UIColor.lightGray.cgColor
        itemView.addSubview(iconView)
        
        let label = UILabel(frame: CGRect(x: viewWidth / 2 + 10, y: 0, width: viewWidth / 2 - 20, height: itemHeight))
        label.text = app.name
        label.font = UIFont.systemFont(ofSize: 20)
        itemView.addSubview(label)
        
        return itemView
    }
}
