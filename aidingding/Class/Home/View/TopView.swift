//
//  TopView.swift
//  aidingding
//
//  Created by mydaogj on 16/4/21.
//  Copyright © 2016年 ding. All rights reserved.
//

import UIKit

class TopView: UIView {
    
    weak var delegate: TopViewDelegate?

    private var categoryCollectionView : UICollectionView!
    
    private var flowLayout : UICollectionViewFlowLayout!
    
    var cell:TopCell? = nil
    
    var cellIndex:NSInteger! = 0
    
    var cellTopModelList = [HomeCategoryCellModel](){
        didSet{
            categoryCollectionView.reloadData()
        }
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpCollectionView()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector:#selector(TopView.loadData(_:)),
                                                         name: "TopLoadDataNotification", object: nil)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpCollectionView() {
    
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.itemSize = CGSizeMake((ScreenWidth-30)/3, 22)
        categoryCollectionView = UICollectionView(frame: CGRectMake(0, 10, ScreenWidth, 22), collectionViewLayout: flowLayout)
        categoryCollectionView.backgroundColor = UIColor.clearColor()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.showsVerticalScrollIndicator = false
        categoryCollectionView.registerClass(TopCell.self, forCellWithReuseIdentifier: "TopCell")
        self.addSubview(categoryCollectionView)
    }
    
    func loadData(notification: NSNotification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        
        cellTopModelList = userInfo["cellTopModelList"] as! [HomeCategoryCellModel]
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

//MARK: - UICollectionViewDelegate, UICollectionViewDataSource
extension TopView : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return cellTopModelList.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        cell = categoryCollectionView.dequeueReusableCellWithReuseIdentifier("TopCell", forIndexPath: indexPath) as? TopCell
        cell!.bindModel((cellTopModelList[indexPath.row] ,indexPath.row))
        cellIndex == indexPath.row ? (cell?.titleLabel?.textColor = UIColor.redColor()) : (cell?.titleLabel?.textColor = UIColor.lightGrayColor())
    
        return cell!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        cellIndex = indexPath.row
        
        collectionView.scrollToItemAtIndexPath(indexPath, atScrollPosition: UICollectionViewScrollPosition.CenteredHorizontally, animated: true)
        
        categoryCollectionView.reloadData()
        
        weak var tmpSelf = self
        if tmpSelf!.delegate != nil && ((tmpSelf!.delegate?.respondsToSelector(#selector(TopViewDelegate.topView(_:withItemIndex:)))) != nil) {
            tmpSelf!.delegate!.topView!(tmpSelf!, withItemIndex : indexPath.row)
        }
    }
    
    func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }

}

@objc protocol TopViewDelegate: NSObjectProtocol {
    optional func topView(topView: TopView, withItemIndex itemIndex :Int)
}
