//
//  kkTableViewController.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/20.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit
import ESPullToRefresh

class kkTableViewController: UITableViewController {
/*
    //private var arrData = [ "a", "b", "c" ]
    private var arrData = [ "a", "b", "c", "aa", "aa", "aa", "aa", "aa", "aa", "bb", "bb", "bb", "bb", "bb", "bb", "cc", "cc", "cc", "cc", "cc", "cc", "cc" ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellId1")
        
        //self.tableView.backgroundColor = UIColor.orange
        self.tableView.tableFooterView = UIView(frame: CGRect(x: 10, y: 10, width: 100, height: 100))
        self.tableView.tableFooterView?.backgroundColor = UIColor.green
        
        
//        let _ = self.tableView.es_addPullToRefresh {
//            [weak self] in
//            self?.beginHeaderRefresh()
//        }
//        self.tableView.es_addInfiniteScrolling {
//            [weak self] in
//            self?.beginFooterRefresh()
//        }
        
        let header = TDRefreshHeaderAnimator(frame: CGRect.zero)
        let _ = self.tableView.es_addPullToRefresh(animator: header) {
            [weak self] in
            self?.beginHeaderRefresh()
        }
        self.tableView.es_addInfiniteScrolling {
            [weak self] in
            self?.beginFooterRefresh()
        }
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId1", for: indexPath)
        cell.textLabel?.text = self.arrData[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    deinit {
        print("kkTableViewController deinit")
    }
    
    
    private func beginHeaderRefresh() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
            //sleep(1)
            self.arrData = [ "A", "B", "C" ]
            self.tableView.reloadData()
            self.tableView.es_stopPullToRefresh()
            self.k = 0
        }
    }
    
    private var k = 0
    private var page = 0
    private func beginFooterRefresh() {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//            for _ in 0...2 {
//                self.arrData.append(String(self.k))
//                self.k += 1
//            }
//            self.tableView.reloadData()
//            self.tableView.es_stopLoadingMore()
//            if self.k > 5 {
//                self.tableView.es_noticeNoMoreData()
//            }
//        }
        
        self.page += 1
        print("page = \(self.page)")
        if self.k < 5 {
            for _ in 0...2 {
                self.arrData.append(String(self.k))
                self.k += 1
            }
        }
        self.tableView.reloadData()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.tableView.es_stopLoadingMore()
        }
        
    }
*/
}




class TDRefreshHeaderAnimator: UIView, ESRefreshProtocol, ESRefreshAnimatorProtocol {
    
    var pullToRefreshDescription = "Pull to refresh"
    var releaseToRefreshDescription = "Release to refresh"
    var loadingDescription = "Loading..."
    
    var pullToRefreshImage = UIImage(named: "loading_00")
    var releaseToRefreshImage = UIImage(named: "loading_24")
    var loadingImages :[UIImage] = {
        var arrImgs = [UIImage]()
        for i in 1..<50 {
            let imgName = String(format: "loading_%02d", i)
            let img = UIImage(named: imgName)
            arrImgs.append(img!)
        }
        return arrImgs
    }()
    
    var view: UIView { return self }
    var insets: UIEdgeInsets = UIEdgeInsets.zero
    var trigger: CGFloat = 64.0
    var executeIncremental: CGFloat = 60.0
    var state: ESRefreshViewState = .pullToRefresh
    
    fileprivate let imageView: UIImageView = {
        let imageView = UIImageView.init()
        //imageView.image = UIImage.init(named: "icon_pull_to_refresh_arrow")
        return imageView
    }()
    
    fileprivate let titleLabel: UILabel = {
        let label = UILabel.init(frame: CGRect.zero)
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = UIColor.init(white: 160.0 / 255.0, alpha: 1.0)
        label.textAlignment = .left
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.titleLabel.text = self.pullToRefreshDescription
        self.imageView.image = self.pullToRefreshImage
        self.addSubview(self.imageView)
        self.addSubview(self.titleLabel)
    }
    
    public required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let s = self.bounds.size
        let w = s.width
        let h = s.height
        titleLabel.frame = CGRect.init(x: w / 2.0 - 50.0, y: 0.0, width: w - (w / 2.0 - 50.0), height: h)
        imageView.frame = CGRect.init(x: titleLabel.frame.origin.x - 28.0, y: (h - 18.0) / 2.0, width: 18.0, height: 18.0)
    }
    
    func refreshAnimationBegin(view: ESRefreshComponent) {
        self.titleLabel.text = self.loadingDescription
        self.imageView.animationImages = self.loadingImages
        self.imageView.animationDuration = 1.5
        self.imageView.animationRepeatCount = 0
        self.imageView.startAnimating()
    }
    
    func refreshAnimationEnd(view: ESRefreshComponent) {
        self.titleLabel.text = self.pullToRefreshDescription
        self.imageView.image = self.pullToRefreshImage
        self.imageView.stopAnimating()
    }
    
    func refresh(view: ESRefreshComponent, progressDidChange progress: CGFloat) {
        // do nothing
    }
    
    func refresh(view: ESRefreshComponent, stateDidChange state: ESRefreshViewState) {
        switch state {
        case .refreshing:
            titleLabel.text = loadingDescription
            self.imageView.animationImages = self.loadingImages
            self.imageView.animationDuration = 1.5
            self.imageView.animationRepeatCount = 0
            self.imageView.startAnimating()
            break
        case .releaseToRefresh:
            titleLabel.text = releaseToRefreshDescription
            imageView.image = releaseToRefreshImage
            break
        default:
            titleLabel.text = pullToRefreshDescription
            imageView.image = pullToRefreshImage
            break
        }
    }
    
}



