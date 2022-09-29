//
//  ProfileVC.swift
//  FitnessApp
//
//  Created by Cenk Bahadır Çark on 27.09.2022.
//

import UIKit
import Charts


final class ProfileVC: UIViewController,ChartViewDelegate{
    //
    @IBOutlet weak private var heightView: UIView!
    @IBOutlet weak private var weightView: UIView!
    //Outlets
    @IBOutlet weak private var imageView: UIImageView!
    //Charts
    @IBOutlet weak private var bartChart: BarChartView!
    //USER DATA
    @IBOutlet weak private var userNameLbl: UILabel!
    @IBOutlet weak private var weightLbl: UILabel!
    @IBOutlet weak private var heightLbl: UILabel!
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        configureView()
        bartChart.delegate = self
        userNameLbl.text = "Welcome \(UserData.shared.userName)!"
        weightLbl.text = "\(UserData.shared.userWeight) kg"
        heightLbl.text = "\(UserData.shared.userHeight) cm"
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        var entries = [BarChartDataEntry]()
        entries.append(BarChartDataEntry(x: 2, y: 3))
        entries.append(BarChartDataEntry(x: 4, y: 5))
        entries.append(BarChartDataEntry(x: 6, y: 7))
        entries.append(BarChartDataEntry(x: 8, y: 9))
        entries.append(BarChartDataEntry(x: 10, y: 11))
        entries.append(BarChartDataEntry(x: 12, y: 13))
        entries.append(BarChartDataEntry(x: 14, y: 15))
        
        let set = BarChartDataSet(entries: entries)
        set.colors = ChartColorTemplates.joyful()
        
        let data = BarChartData(dataSet: set)
        bartChart.data = data
    }
    private func configureView(){
        heightView.layer.cornerRadius = 25
        weightView.layer.cornerRadius = 25
        imageView.layer.cornerRadius = 115
    }
    

}
