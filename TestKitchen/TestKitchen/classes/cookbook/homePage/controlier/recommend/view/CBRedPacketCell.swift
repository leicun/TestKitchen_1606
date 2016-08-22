//
//  CBRedPacketCell.swift
//  TestKitchen
//
//  Created by qianfeng on 16/8/18.
//  Copyright © 2016年 leicun. All rights reserved.
//

import UIKit

class CBRedPacketCell: UITableViewCell {
    
    
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    var model:CBRecommendWidgetListModel?{
        didSet {
            showData()
        }
    }
    
    func showData(){
        for sub in scrollView.subviews{
            sub.removeFromSuperview()
        }
        
        
        //容器视图
        let container = UIView.createView()
        scrollView.addSubview(container)
        
        container.snp_makeConstraints {
            [weak self]
            (make) in
            make.edges.equalTo((self?.scrollView)!)
            make.height.equalTo((self?.scrollView.snp_height)!)
        }
        
        //循环添加图片
        let cnt = model?.widget_data?.count
        var lastView:UIView? = nil
        if cnt > 0{
            for i in 0..<cnt!{
                let imageModel = model?.widget_data![i]
                if imageModel?.type == "image"{
                    let imageView = UIImageView.createImageView(nil)
                    let url = NSURL(string: (imageModel?.content)!)
                    imageView.kf_setImageWithURL(url, placeholderImage: UIImage(named: "sdefaultImage"), optionsInfo: nil, progressBlock: nil, completionHandler: nil)
                    container.addSubview(imageView)
                    
                    imageView.snp_makeConstraints(closure: { (make) in
                        make.top.bottom.equalTo(container)
                        make.width.equalTo(180)
                        if i == 0{
                            make.left.equalTo(0)
                        }else{
                            make.left.equalTo((lastView?.snp_right)!)
                        }
                    })
                    
                    //添加点击事件
                    imageView.userInteractionEnabled = true
                    imageView.tag = 400+i
                    let g = UITapGestureRecognizer(target: self, action: #selector(tapAction(_:)))
                    lastView = imageView
                }
            }
            //修改容器大小
            container.snp_makeConstraints(closure: { (make) in
                make.right.equalTo((lastView?.snp_right)!)
            })
        }
        
        
    
    
    }

    
    func tapAction(g:UIGestureRecognizer){
        let index = (g.view?.tag)!-400
        print(index)
    
    }
    
    class func createRedPackageCellFor(tableView:UITableView,atIndexPath indexPath:NSIndexPath,withListModel listModel:CBRecommendWidgetListModel)->CBRedPacketCell{
        let cellId = "redPacketCellId"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellId) as? CBRedPacketCell
        if cell == nil {
            cell = NSBundle.mainBundle().loadNibNamed("CBRedPacketCell", owner: self, options: nil).last as? CBRedPacketCell
        }
        
        cell?.model = listModel
        return cell!
        
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}



















