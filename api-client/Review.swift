//
//  Review.swift
//  api-client
//
//  Created by Steven Sherry on 4/9/17.
//  Copyright © 2017 Steven Sherry. All rights reserved.
//

import Foundation

struct Review {
    var id: String = ""
    var title: String = ""
    var text: String = ""
    
    static func parseReviewJSONData(data: Data) -> [Review] {
        var foodTruckReviews = [Review]()
        
        do {
            let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
            
            //Parse JSON
            if let reviews = jsonResult as? [Dictionary<String, AnyObject>] {
                for review in reviews {
                    var newReview = Review()
                    newReview.id = review["_id"] as! String
                    newReview.title = review["title"] as! String
                    newReview.text = review["text"] as! String
                    
                    foodTruckReviews.append(newReview)
                }
            }
        } catch let err {
            print(err)
        }
        return foodTruckReviews
    }
}
