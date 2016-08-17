//
//  BaseViewController.swift
//  TestKitchen
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 leicun. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func addNavTitle(title:String){
        let titleLabel = UILabel.createLabel(title, font: UIFont.boldSystemFontOfSize(24), textAlignment: .Center, textColor: UIColor.blackColor())
        self.navigationItem.titleView = titleLabel
    }
    
    func addNavBtn(imageName:String,target:AnyObject?,action:Selector,isLeft:Bool){
    
        let btn = UIButton.createBtn(nil, bgImageName: imageName, selecBgImageName: nil, target: target, action:action)
        let barBtnItem = UIBarButtonItem(customView: btn)
        btn.frame = CGRectMake(0, 5, 25, 40)
        
        if isLeft{
            self.navigationItem.leftBarButtonItem = barBtnItem
        }else{
            self.navigationItem.rightBarButtonItem = barBtnItem
        }
    }
    
    func addNanBtnkBtn() {
        self.addNavBtn("nav_back_black", target: self, action: #selector(backAction), isLeft: true)
    }
    
    func backAction(){
    
        self.navigationController?.popViewControllerAnimated(true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
