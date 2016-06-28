//
//  TopView.swift
//  aidingding
//
//  Created by mydaogj on 16/4/21.
//  Copyright © 2016年 ding. All rights reserved.
//

import UIKit

class TopView: UIView {

    private var categoryCollectionView : UICollectionView!
    
    private var flowLayout : UICollectionViewFlowLayout!
    
    var cell:TopCell? = nil
    
    var cellModelList = [HomeCategoryCellModel](){
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
                                                         name: "loadDataNotification", object: nil)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpCollectionView() {
    
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        flowLayout.itemSize = CGSizeMake((ScreenWidth-30)/3, 22)
        categoryCollectionView = UICollectionView(frame: CGRectMake(0, 10, ScreenWidth, 22), collectionViewLayout: flowLayout)
        categoryCollectionView.backgroundColor = UIColor.redColor()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.showsVerticalScrollIndicator = false
        categoryCollectionView.registerClass(TopCell.self, forCellWithReuseIdentifier: "TopCell")
        self.addSubview(categoryCollectionView)
    }
    
    func loadData(notification: NSNotification) {
        let userInfo = notification.userInfo as! [String: AnyObject]
        
        cellModelList = userInfo["cellModelList"] as! [HomeCategoryCellModel]
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
}

extension TopView : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return cellModelList.count;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        cell = categoryCollectionView.dequeueReusableCellWithReuseIdentifier("TopCell", forIndexPath: indexPath) as? TopCell
        cell!.bindModel((cellModelList[indexPath.row] ,indexPath.row))
        
        return cell!
    }


}
