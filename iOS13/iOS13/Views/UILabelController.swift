//
//  UILabelController.swift
//  iOS13
//
//  Created by quanjunt on 2019/9/24.
//  Copyright © 2019 quanjunt. All rights reserved.
//

import UIKit

class UILabelController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        view.backgroundColor = UIColor.systemBackground
        
        let label = UILabel(frame: CGRect(x: 0, y: 100, width: kScreenWidth, height: 50))
        label.backgroundColor = UIColor.systemGray
        label.textColor = UIColor.label
        label.textAlignment = .center
        label.text = "UILabel"
        view.addSubview(label)
        
        let label1 = UILabel(frame: CGRect(x: 0, y: 200, width: kScreenWidth, height: 50))
        label1.backgroundColor = getColor()
        label1.textColor = UIColor.label
        label1.textAlignment = .center
        label1.text = "UILabel1"
        view.addSubview(label1)
    }
    
    fileprivate func getCurrentMode() -> Bool {
        let currentMode = UITraitCollection.current.userInterfaceStyle
        if (currentMode == .dark) {
            print("深色模式")
            return true
        }
        
        return false
    }
    
    fileprivate func getColor() -> UIColor {
        return UIColor { (collection) -> UIColor in
            if (collection.userInterfaceStyle == .dark) {
                return UIColor.red
            }
            return UIColor.green
        }
    }
    
    
}

extension UILabelController {
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        
//        let backColor = UIColor.black.resolvedColor(with: previousTraitCollection ?? UITraitCollection(userInterfaceStyle: .dark))
//        view.backgroundColor = backColor
        // 每次模式改变的时候, 这里都会执行
        print("模式改变了")
    }
}
