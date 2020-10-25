//
//  NewUIViewController.swift
//  basic
//
//  Created by 丘秀玉 on 2020/9/20.
//

import UIKit
import SnapKit

class NewUIViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func layou_guide() {
        let btn = UIButton()
        btn.backgroundColor = .red
        view.addSubview(btn)
        
        let btn2 = UIButton()
        btn2.backgroundColor = .blue
        view.addSubview(btn2)
        
        let guide = UILayoutGuide()
        view.addLayoutGuide(guide)
        
        btn.snp.makeConstraints { make in
            make.left.equalTo(guide)
            make.width.height.equalTo(80)
            make.centerY.equalTo(guide)
        }
        
        btn2.snp.makeConstraints { make in
            make.left.equalTo(btn.snp.right).offset(20)
            make.right.equalTo(guide)
            make.height.width.equalTo(btn)
            make.centerY.equalTo(guide)
        }
        
        guide.snp.makeConstraints { make in
            make.center.equalTo(view)
            make.height.equalTo(5)
        }
        
        print(guide.layoutFrame)
        
        print(view.safeAreaLayoutGuide.layoutFrame)
        print(view.safeAreaInsets)
        
//        self.topLayoutGuide
//        self.bottomLayoutGuide
        
//        self.additionalSafeAreaInsets.top
        
//        self.view.safeAreaInsets
//        self.view.safeAreaLayoutGuide.layoutFrame
        
//        self.additionalSafeAreaInsets.top
        
//        var scrollView:UIScrollView
//        scrollView.contentInsetAdjustmentBehavior = .never
        
//        var tableView:UITableView
//        tableView.insetsContentViewsToSafeArea = true
        
//        var collectionView:UICollectionView
//        collectionView.sectionref
    }
    
    func segment() {
        let array = ["A", "b", "c"]
        
        let segmentControl = UISegmentedControl(items: array)
        segmentControl.frame = CGRect(x: 10, y: 100, width: 200, height: 30)
        view.addSubview(segmentControl)
        
        segmentControl.insertSegment(withTitle: "d", at: 0, animated: true)
        
        segmentControl.addTarget(self, action: #selector(change(segment:)), for: .valueChanged)
    }
    
    @objc func change(segment: UISegmentedControl) {
        print(segment.selectedSegmentIndex)
    }
    
    func stackView() {
        let stackView = UIStackView(frame: CGRect(x: 200, y: 200, width: 200, height: 200))
        
        for i in 0...3 {
            let label = UILabel()
//            label.frame = CGRect(x: <#T##CGFloat#>, y: <#T##CGFloat#>, width: <#T##CGFloat#>, height: <#T##CGFloat#>)
            label.text = String(i)
            label.backgroundColor = .gray
            stackView.addArrangedSubview(label)
        }
        
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.distribution = .equalSpacing
        stackView.spacing = 10
        
        let view = stackView.arrangedSubviews[0]
        
        self.view.addSubview(stackView)
    }
}
