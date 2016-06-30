//
//  HomeCell.swift
//  aidingding
//
//  Created by mydaogj on 16/4/19.
//  Copyright © 2016年 ding. All rights reserved.
//

import UIKit

class HomeCell: UITableViewCell {
    
    weak var delegate: HomeCellDelegate?

    @IBOutlet weak var cellImageView: UIImageView!
    
    @IBOutlet weak var labetext: UILabel!
    
    @IBOutlet weak var 评论: UIButton!
    
    @IBOutlet weak var 收藏: UIButton!
    
    @IBOutlet weak var 购买: UIButton!
    
    @IBOutlet weak var textView: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    typealias ModelType = (article: HomeListCellModel, index: Int)
    
    func bindModel(model: ModelType) {
        let article = model.article
//        let index = model.index
        
        labetext.text = article.title
        textView.text = article.descriptionNew
    }
    
    @IBAction func 购买(sender: AnyObject) {
        
        weak var tmpSelf = self
        if tmpSelf!.delegate != nil && ((tmpSelf!.delegate?.respondsToSelector(#selector(HomeCellDelegate.tableHomeCell(_:withButtonIndex:)))) != nil) {
            tmpSelf!.delegate!.tableHomeCell!(tmpSelf!, withButtonIndex : 0)
        }
    }
    

    @IBAction func 收藏(sender: AnyObject) {
        
        weak var tmpSelf = self
        if tmpSelf!.delegate != nil && ((tmpSelf!.delegate?.respondsToSelector(#selector(HomeCellDelegate.tableHomeCell(_:withButtonIndex:)))) != nil) {
            tmpSelf!.delegate!.tableHomeCell!(tmpSelf!, withButtonIndex : 1)
        }
    }
    
    
    @IBAction func 评论(sender: AnyObject) {
        
        weak var tmpSelf = self
        if tmpSelf!.delegate != nil && ((tmpSelf!.delegate?.respondsToSelector(#selector(HomeCellDelegate.tableHomeCell(_:withButtonIndex:)))) != nil) {
            tmpSelf!.delegate!.tableHomeCell!(tmpSelf!, withButtonIndex : 2)
        }
    }
    
}

@objc protocol HomeCellDelegate: NSObjectProtocol {
    optional func tableHomeCell(homeCell: HomeCell, withButtonIndex buttonIndex :Int)
}








