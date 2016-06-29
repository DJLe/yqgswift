//
//  JXCouponListTableViewCell.swift
//  HongDian
//
//  Created by 单于 on 16/1/13.
//  Copyright © 2016年 BJ HL. All rights reserved.
//

let JXCouponListTableViewCellSwiftReusedId  = "JXCouponListTableViewCellSwift"

import UIKit

class JXCouponListTableViewCellSwift: UITableViewCell {

    
    @IBOutlet weak var couponNameLabel: UILabel!
    @IBOutlet weak var couponExpireTimesLabel: UILabel!
    @IBOutlet weak var couponDiscountLabel: UILabel!
    @IBOutlet weak var couponStatusLabel: UILabel!
    
    override func awakeFromNib() {
//       couponNameLabel.font = JXC_FONT_SMALL
        
    }
    
    /*
    
    // 重写 set 方法
    var couponModel :JXCouponModel? {
    
        didSet{
            self.couponNameLabel.text = couponModel!.name;
            
            let expireTimestamp = (couponModel?.expireTimestamp)! as NSString
            let expireTimestampSubString = expireTimestamp.substringToIndex(10) as String
            
            self.couponExpireTimesLabel.text = expireTimestampSubString
            
            self.couponDiscountLabel.text = "现金券" +  "\(couponModel!.discount)"
            
        }
    }

 
 */
    
    
}
