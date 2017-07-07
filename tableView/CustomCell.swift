//
//  CustomCell.swift
//  tableView
//
//  Created by 范云飞 on 2017/7/5.
//  Copyright © 2017年 范云飞. All rights reserved.
//

import UIKit
import SDWebImage

class CustomCell: UITableViewCell {
    
    //闭包类型 1.()->(),参数，无返回值
    var btnClickBlock:(()->())?
    var newModel:Items = Items()
    var ImageView: UIImageView = UIImageView()
    var label:UILabel = UILabel()
    var button:UIButton = UIButton()
    
    
    
    
    var model:Items{
        set{
            setFrame()
            self.newModel = newValue
            self.ImageView.sd_setImage(with: NSURL(string:self.newModel.cover_image_url)! as URL)
            self.label.text = self.newModel.introduction
        }
        get{
            return self.newModel
        }
    }
    
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = UITableViewCellSelectionStyle.none
        
        //添加控件
        setUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUI() {
        
        let tempImage = UIImageView.init()
        tempImage.layer.masksToBounds = true;
        tempImage.layer.cornerRadius = 15
        tempImage.backgroundColor = UIColor.red
        self.contentView.addSubview(tempImage)
        self.ImageView = tempImage
        
        let tempButton = UIButton.init()
        tempButton.setTitle("关注", for: UIControlState.normal)
        tempButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        tempButton.backgroundColor = UIColor.black
        tempButton.layer.masksToBounds = true
        tempButton.layer.cornerRadius = 15
        tempButton.addTarget(self, action: #selector(click(sender:)), for: UIControlEvents.touchUpInside)
        self.contentView.addSubview(tempButton)
        self.button = tempButton
        
        let tempLab = UILabel.init()
        tempLab.text = "你大爷的"
        tempLab.numberOfLines = 3
        tempLab.sizeToFit()
        self.contentView.addSubview(tempLab)
        self.label = tempLab
    
    }
    
    func setFrame(){
        self.ImageView.snp.makeConstraints { (make) in
            make.top.left.equalTo(10)
            make.size.equalTo(CGSize(width: 80, height: 80))
        }
        
        self.button.snp.makeConstraints { (make) in
            make.top.equalTo(35)
            make.right.equalTo(-10)
            make.size.equalTo(CGSize(width: 100, height: 30))
        }
        
        self.label.snp.makeConstraints { (make) in
            make.left.equalTo(self.ImageView.snp.right).offset(10)
            make.top.equalTo(10)
            make.right.equalTo(self.button.snp.left).offset(-10)
        }
        
    }
    
    func click(sender:UIButton) -> Void {
        if self.btnClickBlock != nil {
            self.btnClickBlock!()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
