//
//  FoodTruckCell.swift
//  api-client
//
//  Created by Steven Sherry on 4/10/17.
//  Copyright © 2017 Steven Sherry. All rights reserved.
//

import UIKit

class FoodTruckCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var foodTypeLabel: UILabel!
    @IBOutlet weak var averageCostLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(truck: FoodTruck){
        nameLabel.text = truck.name
        foodTypeLabel.text = truck.foodType
        averageCostLabel.text = "$\(truck.averageCost)"
    }

}
