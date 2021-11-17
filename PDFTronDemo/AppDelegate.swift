//
//  AppDelegate.swift
//  PDFTronDemo
//
//  Created by   on 10/11/21.
//

import UIKit
import PDFNet

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        PTPDFNet.initialize("Insert Commercial License Key Here After Purchase")
        window?.overrideUserInterfaceStyle = .light
        return true
    }

}

