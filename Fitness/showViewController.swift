//
//  showViewController.swift
//  Fitness
//
//  Created by 田磊 on 15/12/10.
//  Copyright © 2015年 田磊. All rights reserved.
//

import UIKit

class showViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var rightButton: UIBarButtonItem!
    
    
    @IBAction func changePage(sender: AnyObject) {
    }
    
    
    @IBAction func onBack(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: {
            NSLog("返回主界面")
            
        })
    }
    
    @IBAction func onHiddenClick(sender: AnyObject) {
        if (self.view.hidden) {
            self.view.hidden = false
            rightButton.title = "显示"
        }
        else{
            self.view.hidden = true
            rightButton.title = "隐藏"
        }
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
