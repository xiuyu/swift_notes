//
//  ViewController.swift
//  swift_project
//
//  Created by xiuyu on 2019/8/7.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let kvc = KVCClass()
        kvc.setValue("kvc", forKey: "kvcName")
        
        print(kvc.kvcName)
        
        kvc.addObserver(self, forKeyPath: "kvoName", options: .new, context: nil)
        
        kvc.kvoName = "kvo"
        
        kvc.removeObserver(self, forKeyPath: "kvoName")
        
        let obj = NSObject()
        obj.name = "name"
    }
    
    func swizzle() {
        let originalSelector = #selector(viewWillAppear(_:))
        let swizzleSelector = #selector(swizzle_viewWillAppear(_:))
        
        let cls = classForCoder
        
        let originalMethod = class_getInstanceMethod(cls, originalSelector)
        let swizzleMethod = class_getInstanceMethod(cls, swizzleSelector)
        
        let add = class_addMethod(cls, originalSelector, method_getImplementation(swizzleMethod!), method_getTypeEncoding(swizzleMethod!))
        
        if add {
            class_addMethod(cls, swizzleSelector, method_getImplementation(originalMethod!), method_getTypeEncoding(originalMethod!))
        }
        else {
            method_exchangeImplementations(originalMethod!, swizzleMethod!)
        }
    }
    
    @objc func swizzle_viewWillAppear(_ animated: Bool) {
        print("swizzle_viewWillAppear")
//        swizzle_viewWillAppear(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("viewWillAppear ")
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey: Any]?, context: UnsafeMutableRawPointer?) {
        print("key path :\(keyPath!)", change![.newKey] as! String)
    }
}

/// kvo kvc
class KVCClass: NSObject {
    @objc var kvcName = ""
    @objc dynamic var kvoName = ""
}

// MARK: - 给分类添加属性

extension NSObject {
    private static var nameKey: Void?
    
    var name: String? {
        get {
            return objc_getAssociatedObject(self, &NSObject.nameKey) as? String
        }
        
        set {
            objc_setAssociatedObject(self, &NSObject.nameKey, newValue, .OBJC_ASSOCIATION_RETAIN)
        }
    }
}

extension DispatchQueue {
    private static var _onceTracker = [String]()
    public class func once(token: String, block: () -> ()) {
        objc_sync_enter(self)
        defer {
            objc_sync_exit(self)
        }
        if _onceTracker.contains(token) {
            return
        }
        _onceTracker.append(token)
        block()
    }
    
    func async(block: @escaping () -> ()) {
        async(execute: block)
    }
    
    func after(time: DispatchTime, block: @escaping () -> ()) {
        asyncAfter(deadline: time, execute: block)
    }
}
