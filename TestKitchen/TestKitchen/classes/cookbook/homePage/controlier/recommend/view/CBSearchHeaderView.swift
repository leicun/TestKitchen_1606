//
//  CBSearchHeaderView.swift
//  TestKitchen
//
//  Created by qianfeng on 16/8/18.
//  Copyright © 2016年 leicun. All rights reserved.
//

import UIKit

class CBSearchHeaderView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
//        let searchBar = UISearchBar(frame: CGRectMake(0,0,bounds.size.width,bounds.size.height))
//        
//        searchBar.barTintColor = UIColor.whiteColor()
//
//        searchBar.placeholder = "输入搜索内容"
//        
//        
//        addSubview(searchBar)
        
        //
        let textField = UITextField(frame: CGRectMake(40,4,bounds.size.width-40*2,bounds.size.height-4*2))
        textField.borderStyle = .RoundedRect
        textField.placeholder = "输入菜名或食材搜索"
        addSubview(textField)
        let imgView = UIImageView.createImageView("search1")
        imgView.frame = CGRectMake(0, 0, 25, 25)
        textField.leftView = imgView
        textField.leftViewMode = .Always
        backgroundColor = UIColor(white: 0.8, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
