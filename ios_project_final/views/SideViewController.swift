//
//  SideViewController.swift
//  ios_project_final
//
//  Created by LS J on 2018/5/30.
//  Copyright © 2018年 LS J. All rights reserved.
//

import UIKit

class SideViewController: UIViewController {
    
    var base: BaseClass = BaseClass()
    var sign:String = String()

    static let TABLEVIEWCELLIDENTIFIER = "TABLEVIEWCELLIDENTIFIER"
    let titleArray = ["项目一", "项目二", "项目三", "项目四"]
    let imageArray = ["02", "04", "07", "05"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sign = base.cacheGetString(key: "sign")
        view.backgroundColor = .white
        view.addSubview(backImage)
        view.addSubview(rootTableView)
        let returnToLogin = UIButton()
        returnToLogin.frame = CGRect(x: 0, y: 667, width: 300, height: 50)
        returnToLogin.setTitle("退出登录", for: .normal)
        returnToLogin.setTitleColor(UIColor.black, for: .normal)
        returnToLogin.setTitleShadowColor(UIColor.gray, for: .normal)
        returnToLogin.backgroundColor = UIColor.clear
        returnToLogin.titleLabel?.font = UIFont.systemFont(ofSize: 24)
        returnToLogin.setImage(UIImage(named:"Back"),for: .normal)
        returnToLogin.addTarget(self, action:#selector(SideViewController.tapped), for:UIControlEvents.touchUpInside)
        self.view.addSubview(returnToLogin)
    }
    
    // 退出登录
    @objc func tapped(){
        var sb = UIStoryboard(name: "Main", bundle:nil)
        var vc = sb.instantiateViewController(withIdentifier: "loginview") as! ViewController
        self.present(vc, animated: true, completion: nil)
    }
    
    lazy var backImage : UIImageView = { [unowned self] in
        var image = UIImageView(image: UIImage(named: "background_login.jpg"))
        image.frame = self.view.bounds
        image.alpha = 0.85
        return image
        }()
    
    lazy var rootTableView : UITableView = { [unowned self] in
        var tableView : UITableView = UITableView(frame: self.view.bounds, style: .plain)
        tableView.backgroundColor = .clear
        tableView.isScrollEnabled = false
        tableView.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: SideViewController.TABLEVIEWCELLIDENTIFIER)
        tableView.delegate = self
        tableView.dataSource = self
        return tableView
        }()
    
}

extension SideViewController : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SideViewController.TABLEVIEWCELLIDENTIFIER, for: indexPath)
        cell.backgroundColor = .clear
        cell.textLabel?.textColor = .black
        cell.selectionStyle = UITableViewCellSelectionStyle.none
        cell.imageView?.image =    UIImage(named: imageArray[indexPath.row])
        cell.textLabel?.text = titleArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.01
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headView = UIView()
        headView.backgroundColor = .clear
        headView.alpha = 1
        
        let author = UILabel()
        author.frame = CGRect(x: 10, y: 30, width: 300, height: 100)
        author.textAlignment = NSTextAlignment.left
        author.font = UIFont.systemFont(ofSize: 20)
        author.text = "欢迎您"
        author.numberOfLines = 0
        author.textColor = .black
        author.backgroundColor = .clear
        headView.addSubview(author)
        
        // username标题
        let authorName = UILabel()
        authorName.frame = CGRect(x: 200, y: 30, width: 300, height: 100)
        authorName.textAlignment = NSTextAlignment.left
        authorName.font = UIFont.systemFont(ofSize: 25)
        authorName.text = self.sign
        authorName.numberOfLines = 0
        authorName.textColor = .red
        authorName.backgroundColor = .clear
        headView.addSubview(authorName)
        
        return headView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let delegate  = UIApplication.shared.delegate! as! AppDelegate
//        let rootVC = delegate.window?.rootViewController as! XYSideViewControllerSwift
//        rootVC.closeSideVC()
//        let otherVC = OtherViewController()
//        otherVC.title = titleArray[indexPath.row]
//        rootVC.currentNavController?.pushViewController(otherVC, animated: true)
        switch indexPath.row {
        case 1:
            print("1")
        default:
            print("2")
        }
    }
    
}
