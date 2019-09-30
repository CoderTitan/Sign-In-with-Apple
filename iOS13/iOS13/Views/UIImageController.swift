//
//  UIImageController.swift
//  iOS13
//
//  Created by quanjunt on 2019/9/24.
//  Copyright © 2019 quanjunt. All rights reserved.
//

import UIKit

class UIImageController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = UIColor.systemBackground
        let imageView = UIImageView(image: UIImage(named: "image-1"))
        imageView.frame = CGRect(x: 100, y: 200, width: 50, height: 50)
        view.addSubview(imageView)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
