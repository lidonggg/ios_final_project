//
//  HomeViewController.swift
//  ios_project_final
//
//  Created by LS J on 2018/5/30.
//  Copyright © 2018年 LS J. All rights reserved.
//

import UIKit
import SwiftFCXRefresh

class HomeViewController: UIViewController{

    let p = Project()
    
    //let vm = SQLViewModel()
    
    var headerRefreshView: FCXRefreshHeaderView?
    var base: BaseClass = BaseClass()
    var sign:String = String()
    
    var rows = 15
    let cellReuseId = "CellReuseId"
    
    static let ROOTTABLEVIEWCELLIDENTIFIER = "ROOTTABLEVIEWCELLIDENTIFIER"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sign = base.cacheGetString(key: "sign")
        print(sign)
        title = "项目管理"
        view.backgroundColor = .white
        
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.rowHeight = 50
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseId)
//        view.addSubview(tableView)
        
        view.addSubview(rootTableView)
        addRefreshView()
        
        //添加task的图片按钮
        let addImage = UIImageView()
        addImage.frame = CGRect(x: 360, y: 630, width: 50, height: 50)
        addImage.image = UIImage(named: "Icon_add")
        addImage.isUserInteractionEnabled = true;
        let imgClick = UITapGestureRecognizer(target: self, action: #selector(imgPuls));
        addImage.addGestureRecognizer(imgClick)
        self.view.addSubview(addImage)
    }
    
    @objc func imgPuls(){
        print("add_success")
    }
    
    //刷新方法
    func addRefreshView() {
        headerRefreshView = rootTableView.addFCXRefreshHeader { (refreshHeader) in
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.7) {
                self.rows = 15
                
                refreshHeader.endRefresh()
                self.rootTableView.reloadData()
            }}.pullingPercentHandler(handler: { (percent) in
                print("current percent is", percent)
            })
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tabBarController?.tabBar.isHidden = true
    }
    
    lazy var rootTableView : UITableView = { [unowned self] in
        var tableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: HomeViewController.ROOTTABLEVIEWCELLIDENTIFIER)
        return tableView
        }()
    lazy var titleArray : [String] = {
        var array = ["项目一", "项目二", "项目三", "项目四", "项目五", "项目六","项目六","项目六"]
        return array
    }()
    let imageArray : [String] = {
        let array = ["yewan", "shan", "feng", "chang", "fushi", "haidi","haidi","haidi"]
        return array
    }()
}


// MARK -- TableView Delegate
extension HomeViewController : UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.titleArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: HomeViewController.ROOTTABLEVIEWCELLIDENTIFIER, for: indexPath)
        cell.textLabel?.text = self.titleArray[indexPath.row]
        cell.imageView?.image = UIImage(named: self.imageArray[indexPath.row])
        return cell
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let DetailVC = DetailViewController()
        //设置title
        DetailVC.title = titleArray[indexPath.row]
        self.navigationController?.pushViewController(DetailVC, animated: true)
    }
}

