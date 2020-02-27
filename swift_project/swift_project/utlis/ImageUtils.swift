//
//  ImageUtils.swift
//  swift_project
//
//  Created by 丘秀玉 on 2019/12/24.
//  Copyright © 2019 xiuyu. All rights reserved.
//

import UIKit

/// 图片圆角
/// - Parameter imageView: 控件
/// - Parameter radius: 圆角
func imageClip(imageView:UIImageView,radius:CGFloat)  {
    UIGraphicsBeginImageContextWithOptions(imageView.size, false, 1.0)
    
    UIBezierPath(roundedRect: imageView.bounds, cornerRadius: radius).addClip()
    
    imageView.draw(imageView.bounds)
    imageView.image = UIGraphicsGetImageFromCurrentImageContext()
    
    UIGraphicsEndImageContext()

}

func imageClip2(imageView: UIImageView, radius: CGFloat)  {
    imageView.layer.cornerRadius = radius
    imageView.layer.masksToBounds = true
}
