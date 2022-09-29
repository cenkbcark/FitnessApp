//
//  LoginVC.swift
//  FitnessApp
//
//  Created by Cenk Bahadır Çark on 28.09.2022.
//

import UIKit

final class LoginVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak private var startButton: UIButton!
    //TextFields
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    private var heightPickerView: UIPickerView?
    private var weightPickerView: UIPickerView?
    private var heightList:[String] = [String]()
    private var weightList:[String] = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        activityIndicator.isHidden = true
        startButton.layer.cornerRadius = 20
        //LIST DATA
        setNumberForHeightList()
        setNumberForWeightList()
        //PICKERVIEW
        heightPickerView = UIPickerView()
        weightPickerView = UIPickerView()
        //DELEGATES
        setDelegates()
        //
        heightTextField.inputView = heightPickerView
        weightTextField.inputView = weightPickerView
        //
        configureToolBar()
        //
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        switch pickerView {
        case heightPickerView:
            return heightList.count
        case weightPickerView:
            return weightList.count
        default:
            return 0
        }
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        switch pickerView {
        case heightPickerView:
            return heightList[row]
        case weightPickerView:
            return weightList[row]
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        switch pickerView {
        case heightPickerView:
            heightTextField.text = heightList[row]
            UserData.shared.userHeight = heightTextField.text ?? "Unknown"
        case weightPickerView:
            weightTextField.text = weightList[row]
            UserData.shared.userWeight = weightTextField.text ?? "Unknown"
        default:
            return
        }
    }

    private func setNumberForHeightList(){
        for number in 120...220{
            heightList.append("\(number)")
        }
    }
    
    private func setNumberForWeightList(){
        for number in 40...120 {
            weightList.append("\(number)")
        }
    }
    
    @objc func okClicked(){
        view.endEditing(true)
    }
    
    @objc func cancelClicked(){
        view.endEditing(true)
    }
    
    private func setDelegates(){
        heightPickerView?.dataSource = self
        heightPickerView?.delegate = self
        weightPickerView?.delegate = self
        weightPickerView?.dataSource = self
    }
    
    private func configureToolBar(){
        
        let toolBar = UIToolbar()
        toolBar.tintColor = UIColor.tintColor
        toolBar.sizeToFit()
        
        let okButton = UIBarButtonItem(title: "OK", style: UIBarButtonItem.Style.done, target: self, action: #selector(LoginVC.okClicked))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: self, action: nil)
        let cancelButton = UIBarButtonItem(title: "Cancel", style: UIBarButtonItem.Style.plain, target: self, action: #selector(LoginVC.cancelClicked))
        
        toolBar.setItems([cancelButton,spaceButton,okButton], animated: true)
        
        heightTextField.inputAccessoryView = toolBar
        weightTextField.inputAccessoryView = toolBar
    }
    
    
    @IBAction private func getStartedBtn(_ sender: Any) {
        
        UserData.shared.userName = nameTextField.text ?? "Unknown"
        
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        infoLabel.isHidden = false
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.isHidden = true
            self.performSegue(withIdentifier: "getStarted", sender: nil)
         }
    }
    
}
