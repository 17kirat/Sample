//
//  AddMealViewController.swift
//  Assignment4Archiving
//
//  Created by Josh Cambrian on 2021-11-17.
//

import UIKit

class AddMealViewController: UIViewController {

    var mealList: MealList!
    var meal: Meal!
    
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var calsfield: UITextField!
    @IBOutlet weak var proteinField: UITextField!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var fiberField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        nameField.text = meal.name
        if let cal = meal.cals {
            calsfield.text = String(cal)
        }
        if let protein = meal.protein{
            proteinField.text = String(protein)
        }
        if let fiber = meal.fiber {
            fiberField.text = String(fiber)
        }
        
        datePicker.date = meal.date
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        if nameField.text! == ""{
            meal = nil
            print("didn't save anything")
        } else {
    
            meal.setName(name: nameField.text!)
            meal.setDate(date: datePicker.date)
            meal.setCals(kCals: Int(calsfield.text!))
            meal.setProtein(grams: Int(proteinField.text!))
            meal.setFiber(grams: Int(fiberField.text!))
        
            
            mealList.addMeal(meal: meal)
        }
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
