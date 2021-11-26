//
//  MealList.swift
//  Assignment4:Archiving
//
//  Created by Josh Cambrian on 2021-11-17.
//

import Foundation


class MealList{
    var list = [Meal]()
    let mealURL: URL = {
        let docDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        var docDirectory = docDirectories.first!
        return docDirectory.appendingPathComponent("meals.archive")
    }()
    
    init(){
    
        do{
            let data = try Data(contentsOf: mealURL)
            list = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! [Meal]
        }
        catch let e{
            print(e.localizedDescription)
        }
    }
    
    
    
    func deleteMeal(indexPath: IndexPath){
        list.remove(at: indexPath.row)
    }
    
    func saveData(){
        do{
            let data = try NSKeyedArchiver.archivedData(withRootObject: list, requiringSecureCoding: false)
            try data.write(to: mealURL)
        } catch let e {
            fatalError(e.localizedDescription)
        }
    }
    
    func addMeal(meal: Meal){
        
        let date = meal.date

        for (index, i) in list.enumerated() {
            if date.compare(i.date) == .orderedDescending{
                list.insert(meal, at: index)
                return
            }
        }
        
        list.append(meal)
        
    }
    
    
}
