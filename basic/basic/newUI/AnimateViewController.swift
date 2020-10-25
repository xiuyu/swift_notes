//
//  AnimateViewController.swift
//  basic
//
//  Created by 丘秀玉 on 2020/9/21.
//

import UIKit


class AnimateViewController: UIViewController {
    
    override func viewDidLoad() {
        
    }
    
    
    func ani()  {
        let box = UIButton(frame: CGRect(x: 0, y: 100, width: 50, height: 50))
        box.backgroundColor = .red
//        box.addTarget(self, action: #selector(btnHandler), for: .touchUpInside)
        view.addSubview(box)
        
        
        UIView.animate(withDuration: 2) {
            box.frame = box.frame.offsetBy(dx: 200, dy: 0)
        } completion: { (boo) in

        }
        
        
        let animator = UIViewPropertyAnimator(duration: 3, curve: .easeIn) {
            box.frame = box.frame.offsetBy(dx: 200, dy: 0)
        }

        animator.startAnimation()
        
        let ani = CABasicAnimation(keyPath: "position.x")
        ani.fromValue = box.center.x
        ani.toValue = box.center.x + 200
        ani.timingFunction = CAMediaTimingFunction(name: .easeIn)
        ani.duration = 2
        
        box.layer.add(ani, forKey: nil)
    }
}
