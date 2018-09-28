//
//  ViewController.swift
//  NewYorkTimesApp
//
//  Created by CKM1 on 9/27/18.
//  Copyright © 2018 FSD. All rights reserved.
//

import UIKit
import DZNEmptyDataSet
import Shimmer
import BPStatusBarAlert

class ParentViewController: UIViewController , UITableViewDelegate, UITableViewDataSource{

    // MARK: -  IBOutlets and Variables

	@IBOutlet weak var tableView:UITableView!
	
	var dataManager = DataManager()
	var arrArtciles:[Article] = []
    var isDataLoading:Bool = false
    let network = NetworkManager.sharedInstance
    
    // MARK: - 🌻 Life Cycle

	override func viewDidLoad() {
		super.viewDidLoad()
        
        // Set the data source and delegate
        self.tableView.emptyDataSetSource = self;
        self.tableView.emptyDataSetDelegate = self;
        setupNetworking()
        
        
	}
    override func viewWillAppear(_ animated: Bool) {
       
        self.title = "New York Times"
    }
   
    override func viewWillDisappear(_ animated: Bool) {
   
        self.title = ""

    }

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}

    // MARK:- Local Class Methods
	
    func setupNetworking(){
        
        NetworkManager.isReachable { _ in
            
            self.loadData()
            
        }
        network.reachability.whenUnreachable = { reachability in
            self.loadData()
            BPStatusBarAlert().bgColor(color: .orange).message(message:"Network not reachable").show()

            
        }
        NetworkManager.isUnreachable{ _ in
            
            BPStatusBarAlert().bgColor(color: .orange).message(message:"Network not reachable").show()
        }
        
        network.reachability.whenReachable = { reachability in
            self.loadData()
            BPStatusBarAlert().bgColor(color: .green).message(message:"Network is reachable").show()

        }
    }
	func loadData(){
		
		isDataLoading = true
		dataManager.getMostViewedArticles(onSuccess: { articles in
			
			self.isDataLoading = false
			if let articles = articles {
				self.arrArtciles = articles
			}
			DispatchQueue.main.async{
				self.tableView.reloadData()
			}
			
		}) { error in
			
            self.isDataLoading = false
            self.tableView.reloadData()
			
		}
	}
    
    // MARK: - 🏁 Protocols Conformance

	//MARK:- UITableView Delegates and Data Source

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isDataLoading{
            return 2
        }
		return self.arrArtciles.count
	}
	
	// create a cell for each table view row
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
        if isDataLoading {
            
            let cell:LoadingCell = tableView.dequeueReusableCell(withIdentifier:"LoadingCell", for: indexPath) as! LoadingCell
            
            cell.shimeringView.contentView = cell.itemsView;
            cell.shimeringView.isShimmering = true
            
            return cell
        }
        else {
		let cell:ArticleCell = (self.tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ArticleCell)!
		
		// set the text from the data model
		let articleObj:Article = arrArtciles[indexPath.row]
		cell.populateData(article: articleObj)
		
		return cell
            
        }
	}
	
	// method to run when table view cell is tapped
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        if !isDataLoading{
        let detailVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"DetailViewController") as! DetailViewController
            detailVC.articleDetail = arrArtciles[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
        }
        
    }}

