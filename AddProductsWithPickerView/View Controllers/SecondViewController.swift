//
//  SecondViewController.swift
//  Products
//
//  Created by Mac on 16/09/21.
//

import UIKit

protocol SecondViewControllerProtocol:class {
    func passedData(_ category:String?,_ name:String?,_ price:String?)
}

class SecondViewController: UIViewController {
    //
    //MARK: Outlets
    //
    @IBOutlet weak var categoryTextField:UITextField!
    @IBOutlet weak var nameTextField:UITextField!
    @IBOutlet weak var priceTextField:UITextField!
    
    
    var pickerView = UIPickerView()
    var toolBar = UIToolbar()
    
    let pickerViewData = ["ELECTRIC","FASHION"]
    weak var secondViewControllerDelegate:SecondViewControllerProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Add Product"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(doneBtnAction))
        toolBarBtns()
        pickerView.dataSource = self
        pickerView.delegate = self
        pickerView.backgroundColor = .red
        categoryTextField.inputView = pickerView
        categoryTextField.delegate = self
    }
    
    private func toolBarBtns (){
        let toolBarDone = UIBarButtonItem(title: "Done", style: .plain, target: self, action: #selector(toolBarDoneBtnAct))
        let spaceButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let toolBarCancel = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(toolBarCancelBtnAct))
        toolBar.items = [toolBarDone,spaceButton,toolBarCancel]
        toolBar.backgroundColor = .blue
        toolBar.sizeToFit()
        categoryTextField.inputAccessoryView = toolBar
    }
    
    @IBAction func doneBtnAction() {
        secondViewControllerDelegate?.passedData(categoryTextField.text, nameTextField.text, priceTextField.text)
        navigationController?.popViewController(animated: true)
    }
}
//
//MARK: PickerView
//
extension SecondViewController:UIPickerViewDelegate,UIPickerViewDataSource{
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerViewData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerViewData[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        categoryTextField.text = pickerViewData[row]
        
    }
    //
    //MARK: ToolBar button Action
    //
    @objc func toolBarDoneBtnAct(){
        categoryTextField.resignFirstResponder()
    }
    
    @objc func toolBarCancelBtnAct(){
        categoryTextField.resignFirstResponder()
    }
}
//
//MARK: UITextFieldDelegate
//
extension SecondViewController:UITextFieldDelegate{
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        false
    }
}
