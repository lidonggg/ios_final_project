//
//  RegisterViewController.swift
//  ios_project_final
//
//  Created by LS J on 2018/5/28.
//  Copyright © 2018年 LS J. All rights reserved.
//

import UIKit
import Alamofire
class RegisterViewController: UIViewController {

    @IBOutlet weak var userNameText: UITextField!
    
    @IBOutlet weak var passwordText: UITextField!
    
    @IBOutlet weak var confirmPasswordText: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func doRegister(_ sender: UIButton) {
        let username :String = userNameText.text!
        let password :String = passwordText.text!
        let confirmPassword :String = confirmPasswordText.text!
        if password == confirmPassword{
            Alamofire.request("http://127.0.0.1:8885/user/register", method: .post, parameters: ["username":username,"password":password], encoding: URLEncoding.default).responseString(completionHandler: {response in
                if let result = response.result.value {
                    if result == "success"{
                        let successedRegister = ViewController()
//                        self.present(successedRegister, animated: true, completion: {
//                            //print("success")
//                        })
                        self.performSegue(withIdentifier: "showLoginView", sender: self)
                    }
                    else if result == "fail"{
                        print("shibail")
                    }
                }
            })
        }
        
    }
    func doConfirm(){
        
    }
}
