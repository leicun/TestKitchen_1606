//
//  MainTabBarController.swift
//  TestKitchen
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 leicun. All rights reserved.
//

import UIKit

class MainTabBarController: UITabBarController {
    //tabbar的背景视图
    private var bgView:UIView?
    
    private  var array:Array<Dictionary<String,String>>?{
        get {
            let path = NSBundle.mainBundle().pathForResource("Ctrl.Json", ofType: nil)
            var myArray:Array<Dictionary<String,String>>? = nil
            
            if  let filePath = path{
                let data = NSData(contentsOfFile: filePath)
              
                if let jsonData = data{
                    do {
                        let jsonVale = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableContainers)
                        
                        if jsonVale.isKindOfClass(NSArray.self){
                            myArray = jsonVale as? Array<Dictionary<String,String>>
                        }
                    }catch{
                        print(error)
                        return nil
                    }
                }
            }
            return myArray!
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //在内部调用不要写self
        createViewControllers()
        
        
    }
    
    
    //创建视图控制器
    func createViewControllers(){
        
        var ctrlNames = [String]()
        var imageNames = [String]()
        var titleNames = [String]()
        
        if let tmpArray = self.array{
            for dict in tmpArray{
                let name = dict["ctrlName"]
                let titleName = dict["titleName"]
                let imageName = dict["imageName"]
                ctrlNames.append(name!)
                titleNames.append(titleName!)
                imageNames.append(imageName!)
            }

        }else{
            ctrlNames = ["CookbookViewController","CommunityViewController","MallViewController","FoodClassViewController","ProfileViewController"]
            //home_normal  community_normal mine_normal report_normal shike_normal shop_normal
            
            //home_select
           // home_select  community_select mine_select report_select shike_select shop_select
            
            titleNames = ["食材","社区","商城","食客","我的"]
            imageNames = ["home","community","shop","shike","mine"]
        }
        
        var  vCtrlArray = Array<UINavigationController>()
        for i in 0..<ctrlNames.count{
            let ctrlName = "TestKitchen." + ctrlNames[i]
            let cls = NSClassFromString(ctrlName) as! UIViewController.Type
            let ctrl = cls.init()
            let navCtrl = UINavigationController(rootViewController: ctrl)
            vCtrlArray.append(navCtrl)
        }
        self.viewControllers = vCtrlArray
        createCustomTabbar(titleNames, imageNames: imageNames)
    }
    
    func createCustomTabbar(titleNames:[String],imageNames:[String]){
    
        //场景背景视图
        bgView = UIView.createView()
        bgView?.backgroundColor = UIColor.whiteColor()
        bgView?.layer.borderWidth = 1
        bgView?.layer.backgroundColor = UIColor.whiteColor().CGColor
        self.view.addSubview(bgView!)
        
        //添加约束
        bgView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.left.right.equalTo(self!.view)
            make.bottom.equalTo((self?.view)!)
            make.top.equalTo((self?.view.snp_bottom)!).offset(-49)
        })
    
        //按钮的宽度
        let width = KScreenWidth/5.0
        
        for i in 0..<imageNames.count{
            //图片
            let imageName = imageNames[i]
            let titleName = titleNames[i]
            //按钮
            let bgImageName = imageName+"_normal"
            let selectBgImageName = imageName+"_select"
            let btn = UIButton.createBtn(nil, bgImageName: bgImageName, selecBgImageName: selectBgImageName, target: self, action: #selector(clickBtn(_:)))
            bgView?.addSubview(btn)
            btn.snp_makeConstraints(closure: { (make) in
                make.top.bottom.equalTo(self.bgView!)
                make.width.equalTo(width)
                make.left.equalTo(width*CGFloat(i))
            })
            //文字
            let label = UILabel.createLabel(titleName, font: UIFont.systemFontOfSize(8), textAlignment: .Center, textColor: UIColor.grayColor())
            btn.addSubview(label)
            
            label.snp_makeConstraints(closure: { (make) in
                make.left.right.equalTo(btn)
                make.top.equalTo(btn).offset(32)
                make.height.equalTo(12)
            })
            btn.tag = 300+i
            label.tag = 400
            if i == 0{
                btn.selected = true
                label.textColor = UIColor.orangeColor()
            }
        }
    }
    
    
    func clickBtn(curBtn:UIButton){
        
    
        let lastBtnView = bgView!.viewWithTag(300+selectedIndex)
        
        if let tmpBtn = lastBtnView{
            let lastBtn = tmpBtn as! UIButton
            let lastView = tmpBtn.viewWithTag(400)
            
            if let tmpLabdl = lastView{
                let lastLabel = tmpLabdl as! UILabel
                lastBtn.selected = false
                lastLabel.textColor = UIColor.grayColor()
            }
        }
        
        let curLabelView = curBtn.viewWithTag(400)
        if let tmpLabel = curLabelView{
            let curLabel = tmpLabel as! UILabel
            curBtn.selected = true
            curLabel.textColor = UIColor.orangeColor()
        }
        
        //选中视图
        selectedIndex = curBtn.tag - 300
        
        

        
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
}
