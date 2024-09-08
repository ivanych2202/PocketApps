//
//  InfinityScrollView.swift
//  PocketApps
//
//  Created by Ivan Elonov on 08.09.2024.
//

import UIKit

extension UIScrollView {
    func startInfiniteScroll(speed: CGFloat = 1) {
        let animator = InfinityScrollView(scrollView: self, speed: speed)
        animator.startAnimation()
    }
}

class InfinityScrollView {
    weak var scrollView: UIScrollView?
    let speed: CGFloat
    
    init(scrollView: UIScrollView, speed: CGFloat) {
        self.scrollView = scrollView
        self.speed = speed
    }
    
    func startAnimation() {
        animate()
    }
    
    private func animate() {
        guard let scrollView = scrollView else { return }
        
        UIView.animate(withDuration: 0.02, delay: 0, options: [.curveLinear], animations: {
            scrollView.contentOffset.y += self.speed
            if scrollView.contentOffset.y >= scrollView.contentSize.height - scrollView.bounds.height {
                scrollView.contentOffset.y = 0
            }
        }) { _ in
            self.animate()
        }
    }
}
