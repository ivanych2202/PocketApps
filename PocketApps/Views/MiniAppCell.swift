//
//  MiniAppCell.swift
//  PocketApps
//
//  Created by Ivan Elonov on 08.09.2024.
//

import Foundation
import UIKit

import Foundation
import UIKit

class MiniAppCell: UITableViewCell {
    let previewImageView = UIImageView()
    let nameLabel = UILabel()
    let containerView = UIView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(previewImageView)
        containerView.addSubview(nameLabel)
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        previewImageView.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        containerView.layer.cornerRadius = 10
        containerView.layer.borderWidth = 1
        containerView.layer.borderColor = UIColor.lightGray.cgColor
        containerView.clipsToBounds = true
        
        previewImageView.contentMode = .scaleAspectFit
        previewImageView.clipsToBounds = true
        previewImageView.alpha = 0.5
        
        nameLabel.textAlignment = .center
        nameLabel.font = UIFont.boldSystemFont(ofSize: 24)
        nameLabel.textColor = UIColor(red: CGFloat(arc4random()) / 0xFFFFFFFF, green: CGFloat(arc4random()) / 0xFFFFFFFF, blue: CGFloat(arc4random()) / 0xFFFFFFFF, alpha: 1.0)

        
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            containerView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            containerView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            containerView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            
            previewImageView.topAnchor.constraint(equalTo: containerView.topAnchor),
            previewImageView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            previewImageView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            previewImageView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
            
            nameLabel.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            nameLabel.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)
        ])
    }
    
    func configure(with miniApp: MiniApp) {
        previewImageView.image = UIImage(named: miniApp.previewImageName)
        nameLabel.text = miniApp.name
    }
}
