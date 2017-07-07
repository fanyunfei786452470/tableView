//
//  CustomModel.swift
//  tableView
//
//  Created by 范云飞 on 2017/7/6.
//  Copyright © 2017年 范云飞. All rights reserved.
//

import UIKit
import HandyJSON

class CustomModel: HandyJSON {
    var message: String!
    var data: Data!
    var code: Int = 0
    required init() {
    }
    
}



struct Labels :HandyJSON{
    
}
struct Ad_monitors :HandyJSON{
    
}

struct Feature_list :HandyJSON{
    
}

struct Items :HandyJSON{
    var labels: [Labels]!
    var liked: Bool = false
    var media_type: Int = 0
    var status: Int = 0
    var editor_id: Int = 0
    var title: String!
    var ad_monitors: [Ad_monitors]!
    var url: String!
    var cover_animated_webp_url: String!
    var published_at: Int = 0
    var updated_at: Int = 0
    var approved_at: Int = 0
    var limit_end_at: String!
    var template: String!
    var hidden_cover_image: Bool = false
    var feature_list: [Feature_list]!
    var type: String!
    var id: Int = 0
    var content_type: Int = 0
    var content_url: String!
    var share_msg: String!
    var likes_count: Int = 0
    var introduction: String!
    var created_at: Int = 0
    var short_title: String!
    var cover_webp_url: String!
    var cover_image_url: String!
    
}

 struct Paging :HandyJSON{
    var next_url: String!
    
}

struct Data :HandyJSON{
    var items: [Items]!
    var paging: Paging!
    
}
