//
//  OnBoardingCell.swift
//  FitnessApp
//
//  Created by Cenk Bahadır Çark on 4.10.2022.
//

import UIKit

class OnBoardingCell: UICollectionViewCell {
    
    @IBOutlet weak var slideTitle: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var slideDescription: UILabel!
    
    func setCell(_ slide: OnBoardingSlide){
        imageView.image = slide.image
        slideTitle.text = slide.title
        slideDescription.text = slide.description
    }
    
}
