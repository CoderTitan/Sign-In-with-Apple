//
//  ViewController.swift
//  iOS13
//
//  Created by quanjunt on 2019/9/24.
//  Copyright © 2019 quanjunt. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let redView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemBackground
        
        redView.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        redView.backgroundColor = UIColor.systemGray
        redView.layer.borderColor = UIColor.systemBackground.cgColor
        redView.layer.borderWidth = 2
        view.addSubview(redView)
    }
   
}

extension ViewController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        // 每次模式改变的时候, 这里都会执行
        if (previousTraitCollection?.userInterfaceStyle == .dark) {
            redView.layer.borderColor = UIColor.red.cgColor
            overrideUserInterfaceStyle = .light
        } else {
            redView.layer.borderColor = UIColor.green.cgColor
        }
        
    }
}
