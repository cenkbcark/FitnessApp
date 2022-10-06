//
//  DashboardVC.swift
//  FitnessApp
//
//  Created by Cenk Bahadır Çark on 27.09.2022.
//

import UIKit
import Lottie

final class DashboardVC: UIViewController {
    //UIVIEW
    @IBOutlet weak private var bpmView: UIView!
    @IBOutlet weak private var caloriesView: UIView!
    @IBOutlet weak private var stepView: UIView!
    
    @IBOutlet weak var bmiView: UIView!
    @IBOutlet weak var animationView: AnimationView!
    @IBOutlet weak var navBar: UINavigationItem!
    //
    @IBOutlet weak var bimLbl: UILabel!
    @IBOutlet weak var bimView: UIImageView!
    //Views
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        navBar.titleView?.tintColor = .black
        navBar.title = UserData.shared.name
        let bmi = calculateBmi(mass: UserData.shared.userWeight!, height: UserData.shared.userHeight!)
        bimView.image = UIImage(named: bmi)
        bimLbl.text = bmi
        
        
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupAnimation()
    }
    
    func setupAnimation(){
        animationView.animation = Animation.named("running")
        animationView.contentMode = .scaleToFill
        animationView.loopMode = .loop
        animationView.play()
        
    }
    
    func calculateBmi(mass: Int, height: Int) -> String {
        
        let bmi = mass / ((height / 100) * 2)

        switch bmi {
        case 0..<19:
            return "Gain weight"
        case 19..<25:
            return "Totally Fit"
        case 25...:
            return "Lose weight"
        default:
            return ""
        }
    }
    
    func configureView(){
        stepView.layer.borderColor = UIColor.lightGray.cgColor
        stepView.layer.borderWidth = 5.0
        stepView.layer.cornerRadius = 77
        
        bmiView.layer.borderColor = UIColor.lightGray.cgColor
        bmiView.layer.borderWidth = 5.0
        bmiView.layer.cornerRadius = 77
        
        caloriesView.layer.borderColor = UIColor.lightGray.cgColor
        caloriesView.layer.borderWidth = 5.0
        caloriesView.layer.cornerRadius = 77
        
        bpmView.layer.borderColor = UIColor.lightGray.cgColor
        bpmView.layer.borderWidth = 5.0
        bpmView.layer.cornerRadius = 77
        
        
    }
}
