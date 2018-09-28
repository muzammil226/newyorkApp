//
//  Articles.swift
//  NewYorkTimesApp
//
//  Created by CKM1 on 9/27/18.
//  Copyright © 2018 FSD. All rights reserved.
//

import Foundation
struct ArticlesResponse:Decodable {
	
	var status:String? = ""
	var copyright:String? = ""
	var num_results:Int = 0
	var results: [Article]? = nil
	
}

struct Article:Decodable {
	
	var url:String? = ""
	var adx_keywords:String? = ""
	var column:String? = ""
	var section:String? = ""
	var byline:String? = ""
	var title:String? = ""
	var type:String? = ""
	var abstract:String? = ""
	var published_date:String? = ""
	var source:String? = ""
    var id:Int64 = 0
    var asset_id:Int64 = 0
	var views:Int = 0

	
}
