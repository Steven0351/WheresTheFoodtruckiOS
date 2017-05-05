//
//  AddReviewVC.swift
//  api-client
//
//  Created by Steven Sherry on 4/18/17.
//  Copyright © 2017 Steven Sherry. All rights reserved.
//

import UIKit

class AddReviewVC: UIViewController {
    
    var selectedFoodTruck: FoodTruck?
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var reviewTitle: UITextField!
    @IBOutlet weak var reviewBody: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        if let truck = selectedFoodTruck {
            headerLabel.text = truck.name
        } else {
            headerLabel.text = "Error"
        }
    }
    
    @IBAction func addReviewTapped(sender: UIButton){
        guard let truck = selectedFoodTruck else {
            showAlert(with: "Error", message: "Could not get selected truck")
            return
        }
        guard let title = reviewTitle.text, reviewTitle.text != "" else {
            showAlert(with: "Error", message: "Please enter a title for your review")
            return
        }
        guard let review = reviewBody.text, reviewBody.text != "" else {
            showAlert(with: "Error", message: "Plase enter some text for your review")
            return
        }
        DataService.instance.addNewReview(truck.id, title: title, text: review, completion: { Success in
            if Success {
                print("We saved successfully")
                DataService.instance.getAllReviews(for: truck)
                self.dismissViewController()
            } else {
                self.showAlert(with: "Error", message: "An error occured saving the new review")
                print("Save was unsuccessful")
            }
        })
    }
    
    @IBAction func backButtonTapped(sender: UIButton){
        dismissViewController()
    }

    @IBAction func cancelButtonTapped(sender: UIButton){
        dismissViewController()
    }

    func dismissViewController(){
        OperationQueue.main.addOperation {
            _ = self.navigationController?.popViewController(animated: true)
        }
    }
    
    func showAlert(with title: String?, message: String?) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }

}
