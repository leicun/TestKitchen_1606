//
//  CookbookViewController.swift
//  TestKitchen
//
//  Created by qianfeng on 16/8/15.
//  Copyright © 2016年 leicun. All rights reserved.
//

import UIKit

class CookbookViewController: BaseViewController{
    
    private var recommendView: CBRecommendView?
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        self.createMyNav()
        
        createHomePageView()
        self.downloaderRecommenData()
    }
    
    func createHomePageView(){
        
        self.automaticallyAdjustsScrollViewInsets = false
        
        //推荐
        recommendView = CBRecommendView()
        view.addSubview(recommendView!)
        
        recommendView?.snp_makeConstraints(closure: {
            [weak self]
            (make) in
            make.edges.equalTo(self!.view).inset(UIEdgeInsetsMake(64, 0, 49, 0))
            })
    }
    

    
    
    
    func downloaderRecommenData(){
    
        //methodName=SceneHome&token=&user_id=&version=4.5
        let dict = ["methodName":"SceneHome","token":"","user_id":"","version":"4.5"]
        let downloader = KTCDownloader()
        downloader.delegate = self
        downloader.postWithUrl(kHostUrl, params: dict)
    }
    

    func createMyNav(){
        addNavBtn("saoyisao", target: self, action: #selector(scanAction), isLeft: true)
        addNavBtn("search", target: self, action: #selector(searchAction), isLeft: false)
    }
    func scanAction(){
    
    }
    
    func searchAction(){
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}



extension CookbookViewController:KTCDownloaderDelegate{

    func downloader(downloader: KTCDownloader, didFailWithError error: NSError?) {
        print(error)
    }
    
    func downloader(downloader: KTCDownloader, didFinishWithData data: NSData?) {
       // let str = NSString(data: data!, encoding: NSUTF8StringEncoding)
        
        if let jsonData = data {
            
            let model = CBRecommendModel.parseModel(jsonData)
            
            //回主线程显示数据
            dispatch_async(dispatch_get_main_queue(), {
                [weak self] in
                self!.recommendView?.model = model
                })
            
            
        }
        
    }



}





