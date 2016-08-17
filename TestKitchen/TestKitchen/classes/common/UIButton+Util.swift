//
//  UIButton+Util.swift
//  TestKitchen
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 leicun. All rights reserved.
//

import UIKit
extension UIButton{
    class func createBtn(title:String?,bgImageName:String?,selecBgImageName:String?,target:AnyObject?,action:Selector)->UIButton{
    
        let btn = UIButton(type: .Custom)
        if let btnTitle = title{
            btn.setTitle(btnTitle, forState: .Normal)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
        }
    
        if let btnBgImageName = bgImageName{
            btn.setBackgroundImage(UIImage(named: btnBgImageName), forState: .Normal)
        }
        
        if let btnSelectBgimageName = selecBgImageName{
            btn.setBackgroundImage(UIImage(named: btnSelectBgimageName), forState:.Selected)
        }
        
        if let btnTarget = target{
            btn.addTarget(btnTarget, action: action, forControlEvents: .TouchUpInside)
        }

        return btn
    }


}
