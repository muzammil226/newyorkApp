//
//  ArticleCell.swift
//  NewYorkTimesApp
//
//  Created by CKM1 on 9/27/18.
//  Copyright © 2018 FSD. All rights reserved.
//

import UIKit

class ArticleCell: UITableViewCell {

	@IBOutlet weak var titleHeaderLabel:UILabel!{
		didSet{
			titleHeaderLabel.textColor = UIColor.black;
		}
	}
	@IBOutlet weak var byLineLabel:UILabel!{
		didSet{
			byLineLabel.textColor = UIColor.lightGray;

		}
	}
	
	@IBOutlet weak var dateAndTimeLabel:UILabel!{
		didSet{
			dateAndTimeLabel.textColor = UIColor.darkGray;
			
		}
	}
	@IBOutlet weak var articleImageView:UIImageView!{
		didSet{
			
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
	
	func populateData(article:Article){
		
		titleHeaderLabel.text = article.title
		byLineLabel.text = article.byline
		dateAndTimeLabel.text = article.published_date
	}

}
