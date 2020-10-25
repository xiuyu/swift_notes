//
//  UserCardViewController.swift
//  ModuleA
//
//  Created by 丘秀玉 on 2020/9/20.
//

import Foundation

class UserCardViewController: UIViewController {
    init(userId: Int64) {
        super.init(nibName: nil, bundle: nil)
        print("这是一张用户资料卡 \(userId)")
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "用户卡"

        self.view.backgroundColor = .yellow
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.dismiss(animated: true) {
            print("dismissed ")
        }
    }
}
