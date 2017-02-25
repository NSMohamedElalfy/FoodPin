//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by NSMohamedElalfy on 2/12/17.
//  Copyright © 2017 NSMohamedElalfy. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
  
  var restaurants = [Restaurant(name: "Cafe Deadend", image: "cafedeadend.jpg", location: "Hong Kong", type: "Coffee & Tea Shop", isVisited: false) , Restaurant(name: "Homei", image: "homei.jpg", location: "Hong Kong", type: "Cofe", isVisited: false),Restaurant(name: "Cafe Deadend", image: "cafedeadend.jpg", location: "Hong Kong", type: "Coffee & Tea Shop", isVisited: false),Restaurant(name: "Cafe Deadend", image: "cafedeadend.jpg", location: "Hong Kong", type: "Coffee & Tea Shop", isVisited: false),Restaurant(name: "Cafe Deadend", image: "cafedeadend.jpg", location: "Hong Kong", type: "Coffee & Tea Shop", isVisited: false),Restaurant(name: "Cafe Deadend", image: "cafedeadend.jpg", location: "Hong Kong", type: "Coffee & Tea Shop", isVisited: false),Restaurant(name: "Cafe Deadend", image: "cafedeadend.jpg", location: "Hong Kong", type: "Coffee & Tea Shop", isVisited: false),Restaurant(name: "Cafe Deadend", image: "cafedeadend.jpg", location: "Hong Kong", type: "Coffee & Tea Shop", isVisited: false),Restaurant(name: "Cafe Deadend", image: "cafedeadend.jpg", location: "Hong Kong", type: "Coffee & Tea Shop", isVisited: false)]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    // Uncomment the following line to preserve selection between presentations
    // self.clearsSelectionOnViewWillAppear = false
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem()
  }
  
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  // MARK: - Table view data source
  
  override func numberOfSections(in tableView: UITableView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    // #warning Incomplete implementation, return the number of rows
    return restaurants.count
  }
  
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! RestaurantTableViewCell
    let restaurant = self.restaurants[indexPath.row]
    
    // Configure the cell...
    cell.nameLabel.text = restaurant.name
    cell.locationLabel.text = restaurant.location
    cell.typeLabel.text = restaurant.type
    cell.thumbnailImageView.image = UIImage(named: restaurant.image)
    cell.accessoryType = restaurant.isVisited ? .checkmark : .none
    return cell
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    /*let optionMenu = UIAlertController(title: nil, message: "What do you want to do ?", preferredStyle: .actionSheet)
    let callAction = UIAlertAction(title: "Call 123-000-\(indexPath.row)", style: .default) { (alert : UIAlertAction) in
      let alertMessage = UIAlertController(title: "Service Unavailable", message: "Sorry the call feature is not available yet, please retry later", preferredStyle: .alert)
      alertMessage.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
      self.present(alertMessage, animated: true, completion: nil)
    }
    
    let restaurant = self.restaurants[indexPath.row]
    let checkInAction = UIAlertAction(title:  restaurant.isVisited ? "UnCheck-in" : "Check-in", style: .default) { (alert : UIAlertAction) in
      let cell = tableView.cellForRow(at: indexPath)
      cell?.accessoryType = !restaurant.isVisited ? .checkmark : .none
      restaurant.isVisited = !restaurant.isVisited
    }
    let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    [callAction , checkInAction , cancelAction].forEach{optionMenu.addAction($0)}
    present(optionMenu, animated: true, completion: nil)
    
    tableView.deselectRow(at: indexPath, animated: false)*/
  }
  
  
  override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      restaurants.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
  }
  
  override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
   
    let shareAction = UITableViewRowAction(style: .default, title: "Share") { (action:UITableViewRowAction, indexPath:IndexPath) in
      let restaurant = self.restaurants[indexPath.row]
      let defaultText = "Just Checking in \(restaurant.name)"
      if let imageToShare = UIImage(named: restaurant.image){
      let activityController = UIActivityViewController(activityItems: [defaultText , imageToShare], applicationActivities: nil)
      self.present(activityController, animated: true, completion: nil)
      }
    }
    
    let deleteAction = UITableViewRowAction(style: .default, title: "Delete") { (action:UITableViewRowAction, indexPath:IndexPath) in
      self.restaurants.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .fade)
    }
    
    
    shareAction.backgroundColor = UIColor(red: 30.0/255.0, green: 130.0/255.0, blue: 76.0/255.0, alpha: 1.0)
    deleteAction.backgroundColor = UIColor(red: 236.0/255.0, green: 100.0/255.0, blue: 75.0/255.0, alpha: 1.0)
    
    return [deleteAction , shareAction]
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if segue.identifier == "ShowRestaurantDetails" {
      if let indexPath = tableView.indexPathForSelectedRow {
        let vc = segue.destination as! RestaurantDetailsViewController
        vc.restaurant = self.restaurants[indexPath.row]
      }
    }
  }
}













