//
//  Restaurant.swift
//  FoodPin
//
//  Created by NSMohamedElalfy on 2/23/17.
//  Copyright © 2017 NSMohamedElalfy. All rights reserved.
//

import Foundation


class Restaurant  {
  
  var name:String = ""
  var image:String = ""
  var location:String = ""
  var type : String = ""
  var isVisited:Bool = false
  
  init(name :String, image :String, location:String , type :String, isVisited:Bool) {
    self.name = name
    self.image = image
    self.location = location
    self.type = type
    self.isVisited = isVisited
  }
}
