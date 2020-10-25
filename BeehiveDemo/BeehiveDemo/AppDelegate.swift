//
//  AppDelegate.swift
//  BeehiveDemo
//
//  Created by 丘秀玉 on 2020/9/20.
//

import BeeHive
import ModuleA
import ModuleB
import UIKit

@main
class AppDelegate: BHAppDelegate {
//    var window: UIWindow?
    override func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        
        MuduleAEntrance.register()
        ModuleBEntrance.register()
        
        let result = initBeeHive(application: application, launchOptions: launchOptions) && super.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        let tabVC = UITabBarController()
        
        let homePageVC = HomePageViewController()
        let nav1 = UINavigationController(rootViewController: homePageVC)
        let item1 = UITabBarItem(title: "首页", image: nil, selectedImage: nil)
        nav1.tabBarItem = item1
        
        let mineVC = MineViewController()
        let nav2 = UINavigationController(rootViewController: mineVC)
        let item2 = UITabBarItem(title: "我的", image: nil, selectedImage: nil)
        nav2.tabBarItem = item2
        
        tabVC.viewControllers = [nav1, nav2]
        
        window?.rootViewController = tabVC
        
        return result
    }
    
    private func initBeeHive(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        BHContext.shareInstance().application = application
        BHContext.shareInstance().launchOptions = launchOptions
        #if DEBUG
            BeeHive.shareInstance().enableException = true
        #endif
        BeeHive.shareInstance().context = BHContext.shareInstance()
        BHTimeProfiler.shared().recordEventTime("BeeHive:super start launch")
        return true
    }
}
