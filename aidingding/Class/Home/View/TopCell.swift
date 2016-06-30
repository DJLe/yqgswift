//
//  TopCell.swift
//  aidingding
//
//  Created by mydaogj on 16/6/28.
//  Copyright © 2016年 ding. All rights reserved.
//

import UIKit

class TopCell: UICollectionViewCell {
    
    var titleLabel:UILabel?
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
    
        titleLabel = UILabel(frame: CGRectMake(0, 0, 80, 22))
        titleLabel?.numberOfLines = 0
        titleLabel?.font = UIFont.boldSystemFontOfSize(14.0)
        titleLabel?.textColor = UIColor.lightGrayColor()
        self.addSubview(titleLabel!)
    
        self.backgroundColor = UIColor.clearColor()
    }
    
    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    typealias ModelType = (article: HomeCategoryCellModel, index: Int)
    
    func bindModel(model: ModelType) {
        let article = model.article
//        let index = model.index
        
        titleLabel!.text = article.name
        
        let statusLabelText: NSString = article.name
        let statusLabelSize = statusLabelText.sizeWithAttributes([NSFontAttributeName : titleLabel!.font])
        titleLabel!.frame = CGRectMake((self.contentView.frame.size.width - statusLabelSize.width)/2, 0, statusLabelSize.width, 22)
    }
    
}
