//
//  ViewController.swift
//  tableView
//
//  Created by 范云飞 on 2017/7/5.
//  Copyright © 2017年 范云飞. All rights reserved.
//

import UIKit
import SDWebImage
import SnapKit
import Alamofire
import HandyJSON

class ViewController: UINavigationController,UITableViewDelegate,UITableViewDataSource {
    var tableView = UITableView()
    
    
    lazy var dataSource:NSMutableArray = {
        let array = NSMutableArray()
        return array
        
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initUI()
        getData()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataSource.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identify = "cellID"
        var cell:CustomCell = tableView.dequeueReusableCell(withIdentifier: identify, for: indexPath) as! CustomCell
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identify) as! CustomCell
        }
        cell.model = self.dataSource[indexPath.row] as! Items
        
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

    override var prefersStatusBarHidden: Bool{
        return true
    }
    fileprivate func initUI(){
        tableView.dataSource = self;
        tableView.delegate = self;
        //注册cell
        tableView.register(CustomCell.classForCoder(), forCellReuseIdentifier: "cellID")
        self.view.addSubview(tableView)
        
        tableView.snp.makeConstraints { (make) in
            make.top.left.right.bottom.equalTo(0)
        }
    }
    
    fileprivate func getData() {
        
        let RequestUrl = "http://api.liwushuo.com/v2/channels/121/items?generation=2%0A%E5%A8%B1%E4%B9%90&gender=1&limit=20&offset=20"
        weak var weakSelf = self;
       Alamofire.request(RequestUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseString { (response) in
        if response.result.isSuccess{
            if let jsonString = response.result.value{
                if let responseModel = JSONDeserializer<CustomModel>.deserializeFrom(json: jsonString){
                    for model in responseModel.data.items{
                        weakSelf?.dataSource.add(model)
                    }
                    weakSelf?.tableView.reloadData()
                }
            }
        }
    }
}
}

