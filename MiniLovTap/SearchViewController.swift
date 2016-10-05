//
//  SearchViewController.swift
//  MiniLovTap
//
//  Not created by Lee Bennett on 10/4/16.
//  Copyright © 2016. All rights reserved.
//

// Networking manager
// Alamofire (Swift)
// iOS  <--????-->  Server

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var searchTypeSegementedControl: UISegmentedControl!
    var searchResults = [SearchResult]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     

    }
    
    // MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let newStr = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        
        if newStr.characters.count > 2{
            
            // Fetch the type for searching
            var searchType: String!
            
            switch searchTypeSegementedControl.selectedSegmentIndex {
                case 0:
                    searchType = "user"
                case 1:
                    searchType = "organization"
                case 2:
                    searchType = "hashtag"
                default:
                    ()
            }
            
            // Get search results from the server base on the text entered and the type
            LovTapApiManager.sharedManager.getSearchResults(text: newStr, type: searchType, completion: { (json) in
                // Finish making the GET request, and we recieved the json data
                // Convert json -> searchResults
                // Update search results
                // Refresh the tableview
            })
        }

        
        
        return true
        
    }
    
    
    // MARK: - UITableViewDataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResults.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        // Get the cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "SearchCell") as! SearchCell
        
        // Get the result
        let searchResult = searchResults[indexPath.row]
        
        // Modify the cell
        cell.name.text = searchResult.name
//        cell.thumbnail
        
        // Return the cell
        
        return cell
        
    }

}







