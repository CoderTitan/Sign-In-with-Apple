//
//  AppDelegate.swift
//  iOS13
//
//  Created by quanjunt on 2019/9/24.
//  Copyright © 2019 quanjunt. All rights reserved.
//

import UIKit
import AuthenticationServices

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        if #available(iOS 13.0, *) {
            // 钥匙串中取出的
            let userIdentifier = "userIdentifier"
            if (!userIdentifier.isEmpty) {
                // 基于用户的Apple ID授权用户，生成用户授权请求的一种机制
                let appleIDProvider = ASAuthorizationAppleIDProvider()
                // 返回完成处理程序中给定用户的凭据状态
                appleIDProvider.getCredentialState(forUserID: userIdentifier) { (state, error) in
                    switch state {
                    case .authorized:
                        print("授权状态有效")
                    case .notFound:
                        print("授权凭证缺失（可能是使用AppleID 登录过App）")
                    case .revoked:
                        print("上次使用苹果账号登录的凭据已被移除，需解除绑定并重新引导用户使用苹果登录")
                    default:
                        print("未知状态")
                    }
                }
            }
        }
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


    
}

