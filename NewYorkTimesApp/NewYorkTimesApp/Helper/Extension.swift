//
//  EmptyDataViewController.swift
//  NewYorkTimesApp
//
//  Created by Apple1 on 9/28/18.
//  Copyright © 2018 FSD. All rights reserved.
//

import Foundation
import DZNEmptyDataSet
import Reachability
import BPStatusBarAlert

//MARK:- ParentViewController Class Extension

extension ParentViewController:  DZNEmptyDataSetSource, DZNEmptyDataSetDelegate{


    func title(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
            let str = "No Articles found!"
            let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.headline)]
            return NSAttributedString(string: str, attributes: attrs)
        }
        
        func description(forEmptyDataSet scrollView: UIScrollView) -> NSAttributedString? {
            let str = "Please check your internet connection."
            let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body)]
            return NSAttributedString(string: str, attributes: attrs)
        }
        
        func image(forEmptyDataSet scrollView: UIScrollView) -> UIImage? {
            return UIImage(named: "taylor-swift")
        }
        
        func buttonTitle(forEmptyDataSet scrollView: UIScrollView, for state: UIControlState) -> NSAttributedString? {
            let str = "Tap to refresh Data"
            let attrs = [NSAttributedStringKey.font: UIFont.preferredFont(forTextStyle: UIFontTextStyle.callout)]
            return NSAttributedString(string: str, attributes: attrs)
        }
        
        func emptyDataSet(_ scrollView: UIScrollView, didTap button: UIButton) {
            self.loadData()
        }
}

