//
//  LoadingCell.swift
//  NewYorkTimesApp
//
//  Created by Apple1 on 9/28/18.
//  Copyright © 2018 FSD. All rights reserved.
//

import UIKit
import Shimmer

class LoadingCell: UITableViewCell {

    @IBOutlet weak var shimeringView:FBShimmeringView!
    @IBOutlet weak var itemsView:UIView!

    @IBOutlet weak var titleHeaderLabel:UILabel!
    @IBOutlet weak var byLineLabel:UILabel!
    @IBOutlet weak var dateAndTimeLabel:UILabel!
    @IBOutlet weak var articleImageView:UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //self.articleImageView.layer.cornerRadius = self.frame.size.height/2
        //self.articleImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
