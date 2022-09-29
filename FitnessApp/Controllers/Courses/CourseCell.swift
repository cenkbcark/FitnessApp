//
//  CourseCell.swift
//  FitnessApp
//
//  Created by Cenk Bahadır Çark on 27.09.2022.
//

import UIKit

final class CourseCell: UICollectionViewCell {
    
    @IBOutlet weak private var courseIcon: UIImageView!
    @IBOutlet weak private var courseType: UILabel!
    @IBOutlet weak private var bpmLbl: UILabel!
    @IBOutlet weak private var caloriesLbl: UILabel!
    
    func setData(from course: Course){
        
        courseIcon.image = UIImage(named: course.courseIcon!)
        courseType.text = course.courseType
        bpmLbl.text = course.courseBpm
        caloriesLbl.text = course.courseCalory
        
    }
    
    func configureCell(from cell: CourseCell){
        
        cell.layer.cornerRadius = 25
        cell.layer.borderWidth = 2
        cell.layer.borderColor = UIColor.white.cgColor
    }
    
    
}
