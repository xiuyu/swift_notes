//
//  File.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/23.
//

import UIKit

class FileViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        let manager = FileManager.default
        let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first!
        
        let path =  url.appendingPathComponent("objects").path
        
        print(path)
        
        NSKeyedArchiver.archiveRootObject("124", toFile: path)
        

        let data = NSKeyedUnarchiver.unarchiveObject(withFile: path)
        
       
        
    
     
    }
    
    func copy(){
        //从bundle移动到document
        let home = NSHomeDirectory() + "/Documents"
        
        if FileManager.default.fileExists(atPath: home) {
            let bundlePath = Bundle.main.path(forResource: "test", ofType: "sqlite")
            
            if let path = bundlePath {
                do {
                    try FileManager.default.copyItem(atPath: path, toPath: home)
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func path() {
        _ = Bundle.main.bundlePath
        _ = NSHomeDirectory() + "/Documents"
        
        _ = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first
    }
    
    func userDeaful() {
        UserDefaults.standard.setValue("value", forKey: "key")
        UserDefaults.standard.object(forKey: "key")
    }
}
