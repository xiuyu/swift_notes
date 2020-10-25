//
//  ViewController.swift
//  basic2
//
//  Created by 丘秀玉 on 2020/10/23.
//

import PromiseKit
import RxSwift
import SnapKit
import UIKit

struct MusicListViewModel {
//    let data = Observable.just([
//        Music(name: "无条件", singer: "陈奕迅"),
//        Music(name: "你曾是少年", singer: "S.H.E"),
//        Music(name: "从前的我", singer: "陈洁仪"),
//        Music(name: "在木星", singer: "朴树"),
//    ])

    let data = [
        Music(name: "无条件", singer: "陈奕迅"),
        Music(name: "你曾是少年", singer: "S.H.E"),
        Music(name: "从前的我", singer: "陈洁仪"),
        Music(name: "在木星", singer: "朴树"),
    ]
}

class ViewController: UIViewController {
    @objc var tableview: UITableView!

    let musicListViewModel = MusicListViewModel()
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

        tableview = UITableView(frame: view.bounds, style: .plain)
        tableview.backgroundColor = UIColor.red
        tableview.delegate = self
        tableview.dataSource = self
        tableview.register(UITableViewCell.self, forCellReuseIdentifier: "musicCell")
        view.addSubview(tableview)
        
    
        
    }
    
  
    

}

 extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicListViewModel.data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableview.dequeueReusableCell(withIdentifier: "musicCell")!

        let music = musicListViewModel.data[indexPath.row]
        cell.textLabel?.text = music.name
        cell.detailTextLabel?.text = music.singer
        return cell
    }
 }

 extension ViewController: UITableViewDelegate {
    // 单元格点击
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("你选中的歌曲信息【\(musicListViewModel.data[indexPath.row])】")
    }
 }
