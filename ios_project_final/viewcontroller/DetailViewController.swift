//
//  DetailViewController.swift
//  ios_project_final
//
//  Created by LS J on 2018/5/30.
//  Copyright © 2018年 LS J. All rights reserved.
//

import UIKit

// tasks for project
class DetailViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = UIColor.white
        creatSubViewControllers()
        //let tab = AddTaskTabBar()
        //tab.addDelegate = self
        //self.setValue(tab, forKey: "tabBar")
        self.selectedIndex = 0
        view.backgroundColor = .white
        
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //tabBarController?.tabBar.isHidden = true
    }
    
    func creatSubViewControllers(){
        let firstVC  = ToDoTaskViewController ()
        let item1 : UITabBarItem = UITabBarItem (title: "ToDo", image: UIImage(named: "TabBar0_Normal"), selectedImage: UIImage(named: "TabBar0_Selected"))
        firstVC.tabBarItem = item1
        
        let secondVC = HaveDoneTaskViewController ()
        let item2 : UITabBarItem = UITabBarItem (title: "HaveDone", image: UIImage(named: "TabBar0_Selected"), selectedImage: UIImage(named: "TabBar0_Selected"))
        secondVC.tabBarItem = item2
        
        let tabArray = [firstVC,secondVC]
        self.viewControllers = tabArray
    }
    
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

