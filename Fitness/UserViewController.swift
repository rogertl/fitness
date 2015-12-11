//
//  UserViewController.swift
//  Fitness
//
//  Created by 田磊 on 15/12/9.
//  Copyright © 2015年 田磊. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

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
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func onUserBack(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: {
        NSLog("返回按钮点击")
        })
        
        
    }
    @IBAction func onFindPassword(sender: AnyObject) {
        
//        let incoming = sender as! UIButton
//        var titlename:String = ""
//        if incoming.titleLabel == "登录"     {
//            titlename = "登录过程"
//        }
//        switch incoming.restorationIdentifier {
//            case "登录":
//                titlename = "登录过程"
//            
//        }
        let titlename:String = String(sender.restorationIdentifier)
        //NSLog(titlename)
        
        let alertPass:UIAlertController = UIAlertController(title: "找回密码", message: "进入\(titlename)界面", preferredStyle: UIAlertControllerStyle.Alert)
        alertPass.addAction(UIAlertAction(title: "确定", style: UIAlertActionStyle.Cancel, handler: nil))
        
        self.presentViewController(alertPass, animated: true, completion: nil)
        
        
    }

}
