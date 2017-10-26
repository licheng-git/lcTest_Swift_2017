//
//  MineViewController.swift
//  lcTest_PrivateEquity
//
//  Created by licheng on 2017/9/12.
//  Copyright © 2017年 licheng. All rights reserved.
//

import UIKit

class MineViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private var arrData = [
        "Default",
        "美团网 (Meituan.com)",
        "WeChat",
        "TextView",
        "Day",
        "CollectionView"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "MineVC"
        
        let tableView = UITableView(frame: CGRect(x: 10, y: 100, width: UIScreen.main.bounds.size.width-20, height: 500), style: .plain)
        tableView.backgroundColor = UIColor.orange
        tableView.dataSource = self
        tableView.delegate = self
        //tableView.separatorStyle = .none
//        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: "CellId1")  // cell写法二
        self.view.addSubview(tableView)
        //self.automaticallyAdjustsScrollViewInsets = false  // 去除tableview顶部留白
    }
    
    
    // MARK: UITableView DataSource
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // cell写法一
        let CellIdentifier = "CellId"
        var cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifier)
        if cell == nil {
            cell = UITableViewCell(style: .default, reuseIdentifier: CellIdentifier)
            //cell?.selectionStyle = .none
        }
        cell?.textLabel?.text = self.arrData[indexPath.row]
        return cell!
//        // cell写法二  +tableView.register(...
//        let cell = tableView.dequeueReusableCell(withIdentifier: "CellId1", for: indexPath)
//        cell.textLabel?.text = self.arrData[indexPath.row]
//        return cell
    }
    
    // MARK: UITableView Delegate
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//        return 3
//    }
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.size.width, height: 3))
//        view.backgroundColor = UIColor.green
//        return view
//    }
//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 1
//    }
//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let view = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.bounds.size.width, height: 1))
//        view.backgroundColor = UIColor.green
//        return view
//    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(kkTableViewController(), animated: true)
    }
    
}
