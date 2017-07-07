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
    var newModel:Items!
    
    var model:Items{
        set{
            self.newModel = newValue
            
            self.ImageView.sd_setImage(with: NSURL(string:self.newModel.cover_image_url)! as URL)
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
        self.contentView.addSubview(self.ImageView)
        self.contentView.addSubview(self.label)
        self.contentView.addSubview(self.button)
    }
    
    
    lazy var ImageView: UIImageView = {
        let tempImage = UIImageView(frame:CGRect(x: 10, y: 10, width: 80, height: 80))
        tempImage.layer.masksToBounds = true;
        tempImage.layer.cornerRadius = 15
        tempImage.backgroundColor = UIColor.red
//        tempImage.sd_setImage(with: NSURL(string:"http://img03.liwushuo.com/image/170110/d9m77b0sn.jpg-w720")! as URL)
        return tempImage
        
    }()
    
    lazy var label: UILabel = {
        let tempLab = UILabel(frame: CGRect(x: 100, y: 10, width: 100, height: 30))
        tempLab.text = "你大爷的"
        return tempLab
    }()
    
    lazy var button:UIButton = {
        let tempButton = UIButton(frame:CGRect(x: 210, y: 10, width: 100, height: 30))
        tempButton.setTitle("button", for: UIControlState.normal)
        tempButton.setTitleColor(UIColor.red, for: UIControlState.normal)
        tempButton.backgroundColor = UIColor.black
        tempButton.addTarget(self, action: #selector(click(sender:)), for: UIControlEvents.touchUpInside)
        return tempButton
    }()
    
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
