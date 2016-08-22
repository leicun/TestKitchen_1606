//
//  CBHeaderView.swift
//  TestKitchen
//
//  Created by qianfeng on 16/8/19.
//  Copyright © 2016年 leicun. All rights reserved.
//

import UIKit

class CBHeaderView: UIView {
    
    
    private var titleLabel: UILabel?
    private var imageView: UIImageView?

    override init(frame: CGRect) {
        super.init(frame: frame)
        //背景视图
        let bgView = UIView.createView()
        bgView.frame = CGRectMake(0, 10, bounds.size.width, bounds.size.height-10)
        bgView.backgroundColor = UIColor.whiteColor()
        addSubview(bgView)
        
        //标题文字
        let titleW:CGFloat = 160
        let imageW:CGFloat = 24
        let x = (bounds.size.width - titleW - imageW)/2
        titleLabel = UILabel.createLabel(nil, font: UIFont.systemFontOfSize(18), textAlignment: .Center, textColor: UIColor.blackColor())
        
        titleLabel?.frame = CGRectMake(x, 10, titleW, bounds.size.height-10)
        addSubview(titleLabel!)
        
        //右边图片
        imageView = UIImageView.createImageView("more_icon")
        imageView?.frame = CGRectMake(x+titleW, 14, imageW, imageW)
        addSubview(imageView!)
        
        backgroundColor = UIColor(white: 0.8, alpha: 1.0)
    }
    
    
    func configTitle(title:String){
        titleLabel?.text = title
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}













