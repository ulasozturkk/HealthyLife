//
//  AppDelegate.swift
//  HealthyLife
//
//  Created by macbook pro on 23.02.2024.
// apikey =    fsq3xXa36xtToIfqcBWxBuYmidjGONIxYwqrWO3SM7XAJGc=

import UIKit
import FirebaseCore


@main
class AppDelegate: UIResponder, UIApplicationDelegate {

  var window: UIWindow?

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    // Override point for customization after application launch.
    FirebaseApp.configure()
    
    window = UIWindow(frame: UIScreen.main.bounds)
    let nav = UINavigationController(rootViewController: SignInVC())
    
    
    window?.rootViewController = nav
    window?.makeKeyAndVisible()
    return true
  }



}

