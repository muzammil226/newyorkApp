//
//  DataManager.swift
//  NewYorkTimesApp
//
//  Created by CKM1 on 9/27/18.
//  Copyright © 2018 FSD. All rights reserved.
//

import Foundation

class DataManager: NSObject {
	
	
	func getMostViewedArticles(onSuccess:@escaping([Article]?) -> Void, onFailure:@escaping(_ error:Error?)-> Void){
		
		//http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/7.json?api- key=sample-key
		
		let baseURL = "http://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections/1.json?" + "api-key=8dfe96bed81d416c9016b5a6c6061097"

		
		//create the url with NSURL
		let url = URL(string: baseURL)! //change the url
		
		//create the session object
		let session = URLSession.shared
		
		//now create the URLRequest object using the url object
		let request = URLRequest(url: url)
		
		//create dataTask using the session object to send data to the server
		let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
			
			guard error == nil else {
				return
			}
			
			guard let data = data else {
				return
			}
			
			do {
				
				let response = try JSONDecoder().decode(ArticlesResponse.self, from: data)
				print("response: \(String(describing: response.results))")

				onSuccess(response.results)
				
			} catch let error {
				print("Error: \(error.localizedDescription)")
				onFailure(error)
			}
		})
		
		task.resume()
		
	}
	
}
