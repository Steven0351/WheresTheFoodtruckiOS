//
//  AddTruckVC.swift
//  api-client
//
//  Created by Steven Sherry on 4/11/17.
//  Copyright © 2017 Steven Sherry. All rights reserved.
//

import UIKit

class AddTruckVC: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var foodTypeTextField: UITextField!
    @IBOutlet weak var averageCostTexatField: UITextField!
    @IBOutlet weak var latitudeTextField: UITextField!
    @IBOutlet weak var longitudeTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func addNewTruckTapped(sender: UIButton){
        guard let name = nameTextField.text, nameTextField.text != "" else {
            showAlert(with: "Error", message: "Please enter a name")
            return
        }
        guard let foodType = foodTypeTextField.text, foodTypeTextField.text != "" else {
            showAlert(with: "Error", message: "Please enter a food type")
            return
        }
        guard let averageCost = Double(averageCostTexatField.text!), averageCostTexatField.text != "" else {
            showAlert(with: "Error", message: "Please enter an average cost")
            return
        }
        guard let latitude = Double(latitudeTextField.text!), latitudeTextField.text != "" else {
            showAlert(with: "Error", message: "Please enter a latitude")
            return
        }
        guard let longitude = Double(longitudeTextField.text!), longitudeTextField.text != "" else {
            showAlert(with: "Error", message: "Please enter a longitude")
            return
        }
        DataService.instance.addNewFoodTruck(name, foodType: foodType, averageCost: averageCost, latitude: latitude, longitude: longitude) { (Success) in
            if Success {
                print("we saved successfully")
                self.dismissViewController()
            } else {
                self.showAlert(with: "Error", message: "An error occurred saving the new food truck")
                print("We didn't save successfully")
            }
        }
        
    }
    
    @IBAction func cancelTapped(sender: UIButton){
        dismissViewController()
    }
    
    @IBAction func backButtonTapped(sender: UIButton){
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
