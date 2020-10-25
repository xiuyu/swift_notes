//
//  PromiseKitViewController.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/24.
//

import PromiseKit
import UIKit

// 请求结果对象
 struct HttpBin: Codable {
    var origin: String
    var url: String
 }

class PromiseKitViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///then done catch finally
        _ = cook()
            .then(eat)
            .done { data in
                print(data)
            }.catch { error in
                print(error.localizedDescription + "没法吃!")
            }
        
        ///// when race
        _ = when(fulfilled: cutup(), boil())
            .done { result1, result2 in
                print(result1)
                print(result2)
            }.catch({ error in
                print(error.localizedDescription)
            })
        /////after
        after(seconds: 5).done {
            print("5 second....")
        }
        
        /////
        // 请求数据
        fetchData(args: "foo=bar")
            .done { data in
                print("--- 请求结果 ---")
                print(data)
            }.catch { error in
                print("--- 请求失败 ---")
                print(error)
            }
    }
    
    func fetchData(args: String) -> Promise<Any> {
        let url = URL(string: "https://httpbin.org/get?\(args)")
        let request = URLRequest(url: url!)
        // 使用PromiseKit的URLSession扩展方法获取数据
        return URLSession.shared.dataTask(.promise, with: request)
            .validate() // 这个也是PromiseKit提供的扩展方法，比如自动将 404 转成错误
            .map {
                // 将请求结果转成对象
                try JSONDecoder().decode(HttpBin.self, from: $0.data)
            }
    }
    
    //////
    func cook() -> Promise<String> {
        print("开始做饭")
        let p = Promise<String> { resolver in
            
            print("做饭完毕")
            resolver.fulfill("鸡蛋炒饭")
        }
        
        return p
    }
    
    func eat(data: String) -> Promise<String> {
        print("开始吃饭")
        let p = Promise<String> { resolver in
            print("吃饭完毕")
            resolver.fulfill("一块碗和一双筷子")
        }
        
        return p
    }
    
    //////////////////////////
    func cutup() -> Promise<String> {
        let p = Promise<String> { resolver in
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                resolver.fulfill("切菜")
            }
        }
        
        return p
    }
    
    func boil() -> Promise<String> {
        let p = Promise<String> { resolver in
            
            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 3) {
                resolver.fulfill("浇水")
            }
        }
        return p
    }
}
