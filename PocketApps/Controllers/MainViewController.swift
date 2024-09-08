//
//  ViewController.swift
//  PocketApps
//
//  Created by Ivan Elonov on 06.09.2024.

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var contentView: UIView!
    private let itemHeight: CGFloat = UIScreen.main.bounds.height / 8

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupScrollView()
        setupTapGesture()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        scrollView.startInfiniteScroll()
    }
    
    private func setupScrollView() {
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isUserInteractionEnabled = false
        
        contentView = UIView()
        scrollView.addSubview(contentView)
        
        var yOffset: CGFloat = 0
        for _ in 0..<20 {
            for app in MiniAppDataManager.shared.miniApps {
                let itemView = MiniAppDataManager.shared.createItemView(for: app, yOffset: yOffset, itemHeight: itemHeight, viewWidth: view.bounds.width)
                contentView.addSubview(itemView)
                yOffset += itemHeight
            }
        }
        
        contentView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: yOffset)
        scrollView.contentSize = contentView.bounds.size
    }
    
    private func setupTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(handleTap))
        view.addGestureRecognizer(tapGesture)
    }
    
    @objc private func handleTap() {
        performSegue(withIdentifier: "MainToAppsListSegue", sender: self)
    }
}
