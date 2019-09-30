//
//  RootViewController.swift
//  iOS13
//
//  Created by quanjunt on 2019/9/24.
//  Copyright © 2019 quanjunt. All rights reserved.
//

import UIKit
/// 屏幕的宽
let kScreenWidth = UIScreen.main.bounds.size.width
/// 屏幕的高
let kScreenHeight = UIScreen.main.bounds.size.height
/// navigationBar高度（包括状态栏高度）
let kNavigationBarH: CGFloat = kScreenHeight >= 812 ? 88 : 64

class RootViewController: UIViewController {
    
    fileprivate var dataArr: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "UITableView"
        view.backgroundColor = UIColor.white
        
        dataArr = ["UIView", "UILabel", "UIImage", "UIWebView", "Sign In with Apple"]
        let tableView = UITableView(frame: CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - kNavigationBarH))
        tableView.backgroundColor = UIColor.white
        tableView.dataSource = self
        tableView.delegate = self
        view.addSubview(tableView)
    }
}

extension RootViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        if (cell == nil) {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
            cell?.textLabel?.text = dataArr[indexPath.row]
            cell?.selectionStyle = .none
        }
        return cell ?? UITableViewCell()
    }
}

extension RootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vcs = [ViewController(), UILabelController(), UIImageController(), WebViewController(), SignViewController()]
        self.navigationController?.pushViewController(vcs[indexPath.row], animated: true)
    }
}
