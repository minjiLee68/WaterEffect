//
//  AddAlertViewController.swift
//  TimeToTakeMedicine
//
//  Created by 이민지 on 2022/05/13.
//

import UIKit

class AddAlertViewController: UIViewController {
    var pickedDate: ((_ date: Date) -> Void)?
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    @IBAction func dismissButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func saveButtonAction(_ sender: UIBarButtonItem) {
        pickedDate?(datePicker.date)
        self.dismiss(animated: true, completion: nil)
    }
}
