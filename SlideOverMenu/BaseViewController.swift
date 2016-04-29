//
//  BaseViewController.swift
//  SlideOverMenu
//
//  Created by Ngoc Do on 4/11/16.
//  Copyright © 2016 com.appable. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController {
    
    var menuVC:UIViewController!{
        didSet{
            view.layoutIfNeeded()
            menuView.addSubview(menuVC.view)
            
        }
    }
    
    var contentVC:UIViewController!{
        didSet{
            contentVC!.willMoveToParentViewController(contentVC)
            view.layoutIfNeeded()
            contentView.addSubview(contentVC.view)
        }
    }
    
    var originLeftMargin:CGFloat?
    
    @IBOutlet weak var leftMargin: NSLayoutConstraint!
    
    @IBOutlet weak var menuView: UIView!
    
    @IBOutlet weak var contentView: UIView!
    
    
    @IBAction func onPanContentView(panGestureRecognizer: UIPanGestureRecognizer) {
        
        let transition = panGestureRecognizer.translationInView(self.view)
        let velocity = panGestureRecognizer.velocityInView(self.view)
        
        if panGestureRecognizer.state == UIGestureRecognizerState.Began {
            originLeftMargin = leftMargin.constant
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Changed {
            leftMargin.constant = originLeftMargin! + transition.x
        } else if panGestureRecognizer.state == UIGestureRecognizerState.Ended {
            if(velocity.x > 0){
                leftMargin.constant = UIScreen.mainScreen().bounds.width - 100
            }else{
                leftMargin.constant = 0
            }
        }
        
        
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
