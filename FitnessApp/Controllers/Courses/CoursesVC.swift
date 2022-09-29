//
//  CoursesVC.swift
//  FitnessApp
//
//  Created by Cenk Bahadır Çark on 27.09.2022.
//

import UIKit
import AVKit
import AVFoundation

final class CoursesVC: UIViewController {
    
    @IBOutlet weak var courseCollectionView: UICollectionView!
    
    var courseList = [Course]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setCourses()

        
        
    }
    
    func setCourses(){
        let Yoga = Course(courseType: "Yoga", courseIcon: "yoga", courseBpm: "85", courseCalory: "120")
        let Strech = Course(courseType: "Strecth", courseIcon: "stretch", courseBpm: "90", courseCalory: "130")
        let Workout = Course(courseType: "Upper Workout", courseIcon: "workout", courseBpm: "110", courseCalory: "220")
        let lowerWorkout = Course(courseType: "Lower Workout", courseIcon: "lower", courseBpm: "115", courseCalory: "270")
        courseList.append(Yoga)
        courseList.append(Strech)
        courseList.append(Workout)
        courseList.append(lowerWorkout)
    }
    
    func setVideo(courseType: String){
        if let filePath = Bundle.main.path(forResource: courseType, ofType: "mp4"){
            
            let player = AVPlayer(url: URL(fileURLWithPath: filePath))
            let playerControl = AVPlayerViewController()
            
            playerControl.player = player
            
            present(playerControl,animated: true){
                player.play()
            }
        }
    }

}

extension CoursesVC: UICollectionViewDelegate,UICollectionViewDataSource{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return courseList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = courseCollectionView.dequeueReusableCell(withReuseIdentifier: "courseCell", for: indexPath) as? CourseCell{
            let course = courseList[indexPath.row]
            cell.configureCell(from: cell)
            cell.setData(from: course)
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let clickedCourse = courseList[indexPath.row]
        setVideo(courseType: clickedCourse.courseType!)
    
    }
}
