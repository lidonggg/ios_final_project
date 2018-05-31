//
//  ViewController.swift
//  ios_project_final
//
//  Created by LS J on 2018/5/28.
//  Copyright © 2018年 LS J. All rights reserved.
//

import UIKit
import Alamofire

//import SwiftHTTP
class ViewController: UIViewController {
    //public static var Shared=HttpHelper()
    var window: UIWindow?
    //页面间传值
    var base:BaseClass = BaseClass()
    
    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func logIn(_ sender: UIButton) {
        //print("\(userNameText.text)")
        let username :String = userNameText.text!
        let password :String = passwordText.text!
        Alamofire.request("http://127.0.0.1:8885/user/login", method: .post, parameters: ["username":username,"password":password], encoding: URLEncoding.default).responseString(completionHandler: {response in
            if let result = response.result.value {
                if result == "success"{
                    print("success")
                    CBToast.showToast(message: "登录成功", aLocationStr: "bottom", aShowTime: 2.0)
                    //进入主界面
                    let sideVC = SideViewController()
                    let currentMainVC = UITabBarController.init()
                    let navOne = UINavigationController(rootViewController: HomeViewController())
                    
                    currentMainVC.viewControllers = [navOne]
                    let homeVC = XYSideViewControllerSwift(sideVC, currentMainVC)
                    //homeVC.title = "项目管理"
                    self.base.cacheSetString(key: "sign", value: username)
                    self.present(homeVC, animated: true, completion: {
                        //print("success")
                    })
                }
                else if result == "missuser"{
                    self.showMsgbox(_message: "用户名或密码有误")
                    print("missuser")
                }
                else if result == "misspassword"{
                    self.showMsgbox(_message: "密码错误")
                    print("misspassword")
                }
            }
        })
        
    }
    func showMsgbox(_message: String, _title: String = "提示"){
        
        let alert = UIAlertController(title: _title, message: _message, preferredStyle: UIAlertControllerStyle.alert)
        let btnOK = UIAlertAction(title: "好的", style: .default, handler: nil)
        alert.addAction(btnOK)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}

