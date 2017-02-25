//
//  RestaurantTableViewCell.swift
//  FoodPin
//
//  Created by NSMohamedElalfy on 2/12/17.
//  Copyright © 2017 NSMohamedElalfy. All rights reserved.
//

import UIKit

class RestaurantTableViewCell: UITableViewCell {

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var locationLabel: UILabel!
  @IBOutlet weak var typeLabel: UILabel!
  @IBOutlet weak var thumbnailImageView: UIImageView!
  
  
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
      thumbnailImageView.layer.cornerRadius = 30
      thumbnailImageView.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
