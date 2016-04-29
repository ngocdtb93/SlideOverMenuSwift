//
//  MenuViewController.swift
//  SlideOverMenu
//
//  Created by Ngoc Do on 4/11/16.
//  Copyright © 2016 com.appable. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    var listItems = ["Red","Green","Blue"]
    var listViewController:[UIViewController] = []
    
    var baseVC:BaseViewController?

    override func viewDidLoad() {
        super.viewDidLoad()

        createListViewConroller()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func createListViewConroller(){
        let redVC = storyboard?.instantiateViewControllerWithIdentifier("RedNavigation")
        let greenVC = storyboard?.instantiateViewControllerWithIdentifier("GreenNavigation")
        let blueVC = storyboard?.instantiateViewControllerWithIdentifier("BlueNavigation")
        listViewController.append(redVC!)
        listViewController.append(greenVC!)
        listViewController.append(blueVC!)
    }
    
}

extension MenuViewController:UITableViewDelegate, UITableViewDataSource{
func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItems.count
    }
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! MenuCell
        cell.lblMenu.text = listItems[indexPath.row]
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        baseVC!.contentVC = listViewController[indexPath.row]
        baseVC?.leftMargin.constant = 0
    }
}

