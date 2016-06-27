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
    
    var cell:UICollectionViewCell? = nil
    
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
        
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setUpCollectionView() {
    
        flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .Horizontal
        categoryCollectionView = UICollectionView(frame: CGRectMake(0, 0, ScreenWidth - 15, 44), collectionViewLayout: flowLayout)
        categoryCollectionView.backgroundColor = UIColor.redColor()
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.showsVerticalScrollIndicator = false
        categoryCollectionView.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        self.addSubview(categoryCollectionView)
    }
}

extension TopView : UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return 15;
    }
    
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        cell = categoryCollectionView.dequeueReusableCellWithReuseIdentifier("Cell", forIndexPath: indexPath) as UICollectionViewCell
        cell?.backgroundColor = UIColor.blueColor()
        return cell!
    }


}
