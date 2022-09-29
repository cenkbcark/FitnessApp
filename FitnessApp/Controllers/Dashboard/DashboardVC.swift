//
//  DashboardVC.swift
//  FitnessApp
//
//  Created by Cenk Bahadır Çark on 27.09.2022.
//

import UIKit

final class DashboardVC: UIViewController {
    //UIVIEW
    @IBOutlet weak private var bpmView: UIView!
    @IBOutlet weak private var caloriesView: UIView!
    @IBOutlet weak private var stepView: UIView!
    
    var waterImages : [UIImage] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //UI View Configuration
        configureView()
        waterImages = createImageArray(total: 40, imagePrefix: "water")
        
        
        
    }
    
    private func configureView(){
        stepView.layer.cornerRadius = 67
        caloriesView.layer.cornerRadius = 67
        bpmView.layer.cornerRadius = 67
    }
    
    private func createImageArray(total: Int,imagePrefix: String) -> [UIImage]{
        var imageArray = [UIImage]()
        
        for imageCount in 1..<total {
            let imageName = "\(imagePrefix)-\(imageCount).png"
            let image = UIImage(named: imageName)!
            
            imageArray.append(image)
        }
        return imageArray
    }
    
    private func animateWater(imageView: UIImageView,images: [UIImage]){
        
        imageView.animationImages = images
        imageView.animationDuration = 3.0
        imageView.animationRepeatCount = 1
        imageView.startAnimating()
    }
}
