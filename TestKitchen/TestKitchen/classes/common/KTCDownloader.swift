//
//  KTCDownloader.swift
//  TestKitchen
//
//  Created by qianfeng on 16/8/16.
//  Copyright © 2016年 leicun. All rights reserved.
//

import UIKit

import Alamofire

public enum KTCDownloaderType:Int{
   case  Default = 10
    
}

protocol KTCDownloaderDelegate:NSObjectProtocol {
    func downloader(downloader:KTCDownloader,didFailWithError error:NSError?)
    func downloader(downloader:KTCDownloader,didFinishWithData data:NSData?)
}

class KTCDownloader: NSObject {

    weak var delegate:KTCDownloaderDelegate?
    //区分下载
    var type:KTCDownloaderType = .Default
    
    func postWithUrl(urlString:String,params:Dictionary<String,String>?){
        
        Alamofire.request(.POST, urlString, parameters: params, encoding: ParameterEncoding.URL, headers: nil).responseData { (response) in
            switch response.result{
            case .Failure(let error):
                self.delegate?.downloader(self, didFailWithError: error)
            case .Success:
                self.delegate?.downloader(self, didFinishWithData: response.data)
            }
        }
        
    }
}












