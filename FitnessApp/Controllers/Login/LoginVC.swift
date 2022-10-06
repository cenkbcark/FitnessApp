//
//  LoginVC.swift
//  FitnessApp
//
//  Created by Cenk Bahadır Çark on 28.09.2022.
//

import UIKit

final class LoginVC: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
    
    @IBOutlet weak private var startButton: UIButton!
    //TextFields
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    private var heightPickerView: UIPickerView?
    private var weightPickerView: UIPickerView?
    private var heightList:[Int] = [Int]()
    private var weightList:[Int] = [Int]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
            return String(heightList[row])
        case weightPickerView:
            return String(weightList[row])
        default:
            return ""
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        switch pickerView {
        case heightPickerView:
            heightTextField.text = String(heightList[row])
            UserData.shared.userHeight = Int(heightTextField.text!)
            
        case weightPickerView:
            weightTextField.text = String(weightList[row])
            UserData.shared.userWeight = Int(weightTextField.text!)
            
        default:
            return
        }
    }

    private func setNumberForHeightList(){
        for number in 120...220{
            heightList.append(number)
        }
    }
    
    private func setNumberForWeightList(){
        for number in 40...120 {
            weightList.append(number)
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
        
        UserData.shared.name = nameTextField.text ?? "Unknown"
        self.performSegue(withIdentifier: "getStarted", sender: nil)
    }
    
}
