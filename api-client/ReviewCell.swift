//
//  ReviewCell.swift
//  api-client
//
//  Created by Steven Sherry on 4/18/17.
//  Copyright © 2017 Steven Sherry. All rights reserved.
//

import UIKit

class ReviewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var reviewTextLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(review: Review) {
        titleLabel.text = review.title
        reviewTextLabel.text = review.text
    }

}
