//
//  SignViewController.swift
//  iOS13
//
//  Created by quanjunt on 2019/9/25.
//  Copyright © 2019 quanjunt. All rights reserved.
//

import UIKit
import AuthenticationServices

class SignViewController: UIViewController {
    
    fileprivate var showLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Sign In with Apple"
        view.backgroundColor = UIColor.systemBackground
        
        showLabel.frame = CGRect(x: 0, y: 100, width: kScreenWidth, height: 100)
        showLabel.textColor = UIColor.label
        showLabel.backgroundColor = UIColor.systemOrange
        showLabel.textAlignment = .center
        showLabel.numberOfLines = 0
        showLabel.text = "Sign In with Apple"
        view.addSubview(showLabel)
        
        
        // apple登录按钮
        let appleButton = ASAuthorizationAppleIDButton(type: .continue, style: .black)
        appleButton.frame = CGRect(x: 100, y: showLabel.frame.maxY + 40, width: 200, height: 50)
        appleButton.cornerRadius = 40
        appleButton.addTarget(self, action: #selector(appleAction), for: .touchUpInside)
        view.addSubview(appleButton)
        
        
        observeAppleSignInState()
    }
    
    @objc fileprivate func appleAction() {
        // 基于用户的Apple ID授权用户，生成用户授权请求的一种机制
        let appleIDProvider = ASAuthorizationAppleIDProvider()
        // 创建新的AppleID授权请求
        let request = appleIDProvider.createRequest()
        // 所需要请求的联系信息
        request.requestedScopes = [.fullName, .email]
        // 管理授权请求的控制器
        let controller = ASAuthorizationController(authorizationRequests: [request])
        // 授权成功或者失败的代理
        controller.delegate = self
        // 显示上下文的代理, 系统可以在上下文中向用户展示授权页面
        controller.presentationContextProvider = self
        // 在控制器初始化期间启动授权流
        controller.performRequests()
    }

    
    fileprivate func observeAppleSignInState() {
        if #available(iOS 13.0, *) {
            let center = NotificationCenter.default
            center.addObserver(self, selector: #selector(handleStateChange(noti:)), name: ASAuthorizationAppleIDProvider.credentialRevokedNotification, object: nil)
        }
    }

    @objc fileprivate func handleStateChange(noti: Any) {
        print("授权状态发生改变")
        
    }
}

extension SignViewController: ASAuthorizationControllerDelegate {
    // 处理成功的授权
    func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
        print("授权成功")
        // 成功的Apple ID身份验证信息
        if let appleIDCreden = authorization.credential as? ASAuthorizationAppleIDCredential {
            let userIdentifier = appleIDCreden.user
            let fullName = appleIDCreden.fullName
            let email = appleIDCreden.email
            
            // 这里需要我们在系统中创建一个账户, 用于存储用户的唯一标识userIdentifier
            // 可以在系统的钥匙串中存储
            let webVC = WebViewController()
            webVC.user = userIdentifier
            webVC.giveName = fullName?.givenName ?? ""
            webVC.familyName = fullName?.familyName ?? ""
            webVC.email = email ?? ""
            navigationController?.pushViewController(webVC, animated: true)
        } else if let passwordCreden = authorization.credential as? ASPasswordCredential {
            // 密码凭证用户的唯一标识
            let userIdentifiler = passwordCreden.user
            // 密码凭证的密码
            let password = passwordCreden.password
            
            // 显示相关信息
            let message = "APP已经收到您选择的秘钥凭证\nUsername: \(userIdentifiler)\n Password: \(password)"
            showLabel.text = message
        } else {
            showLabel.text = "授权信息均不符"
        }
    }
    
    // 处理授权错误
    func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
        print("授权错误: \(error)")
        
        var showText = ""
        if let authError = error as? ASAuthorizationError {
            let code = authError.code
            switch code {
            case .canceled:
                showText = "用户取消了授权请求"
                break
            case .failed:
                showText = "授权请求失败"
                break
            case .invalidResponse:
                showText = "授权请求响应无效"
                break
            case .notHandled:
                showText = "未能处理授权请求"
                break
            case .unknown:
                showText = "授权请求失败, 未知的错误原因"
                break
            default:
                showText = "其他未知的错误原因"
                break
            }
        }
        showLabel.text = showText
    }
}

extension SignViewController: ASAuthorizationControllerPresentationContextProviding {
    func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
        return self.view.window!
    }
}

