//
//  WebViewController.swift
//  iOS13
//
//  Created by quanjunt on 2019/9/25.
//  Copyright © 2019 quanjunt. All rights reserved.
//

import UIKit

class WebViewController: UIViewController {
    
    var user = ""
    var giveName = ""
    var familyName = ""
    var email = ""


    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.systemBackground

        let userLabel = UILabel()
        userLabel.frame = CGRect(x: 0, y: 100, width: kScreenWidth, height: 50)
        userLabel.backgroundColor = UIColor.systemOrange
        userLabel.textAlignment = .center
        userLabel.text = user
        view.addSubview(userLabel)
        
        let giveLabel = UILabel()
        giveLabel.frame = CGRect(x: 0, y: userLabel.frame.maxY + 30, width: kScreenWidth, height: 50)
        giveLabel.backgroundColor = UIColor.systemOrange
        giveLabel.textAlignment = .center
        giveLabel.text = giveName
        view.addSubview(giveLabel)
        
        let familyLabel = UILabel()
        familyLabel.frame = CGRect(x: 0, y: giveLabel.frame.maxY + 30, width: kScreenWidth, height: 50)
        familyLabel.backgroundColor = UIColor.systemOrange
        familyLabel.textAlignment = .center
        familyLabel.text = familyName
        view.addSubview(familyLabel)
        
        let emailLabel = UILabel()
        emailLabel.frame = CGRect(x: 0, y: familyLabel.frame.maxY + 30, width: kScreenWidth, height: 50)
        emailLabel.backgroundColor = UIColor.systemOrange
        emailLabel.textAlignment = .center
        emailLabel.text = email
        view.addSubview(emailLabel)
    }
    
    
    
    
}
