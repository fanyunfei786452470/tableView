//
//  ViewController.swift
//  tableView
//
//  Created by 范云飞 on 2017/7/5.
//  Copyright © 2017年 范云飞. All rights reserved.
//

import UIKit

class ViewController: UINavigationController,UITableViewDelegate,UITableViewDataSource {
    var tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tableView = UITableView(frame: CGRect(x:0,y:0,width:self.view.frame.size.width,height:self.view.frame.size.height), style: UITableViewStyle.plain)
        tableView.dataSource = self;
        tableView.delegate = self;
        //注册cell
        tableView.register(CustomCell.classForCoder(), forCellReuseIdentifier: "cellID")
        self.view.addSubview(tableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 30
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify = "cellID"
        let cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as! CustomCell
        
//        if (cell == nil) {
//            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identify)
//        }
        
//        if cell == nil {
//            cell = CustomCell(style: UITableViewCellStyle.default, reuseIdentifier: identify)
//        }

//        cell?.textLabel?.text = "nimeia"
        weak var weakSelf = self
        cell.btnClickBlock = {
            let alertController = UIAlertController(title: "点我干吊", message: "massage", preferredStyle: .alert)
            let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "ok", style: .default) { (UIAlertAction) ->Void in
                print("确定")
            }
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            weakSelf?.present(alertController, animated: true, completion: nil)
            
        }
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

