//
//  RxSwiftViewController.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/25.
//

import UIKit
import RxSwift

class RxSwiftViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        _ = Observable<String>.create { (observer) -> Disposable in
            observer.onNext("test")
            observer.onCompleted()
            return Disposables.create()
        }.subscribe { (str) in
            print(str)
        }
        
//        observable.subscribe {
//            print($0)
//        }

        
        let timeObservable = Observable<Int>.interval(RxTimeInterval.milliseconds(1000), scheduler: MainScheduler.instance)
            
        _ = timeObservable.subscribe { (event) in
            print(event)
        }
    }
}
