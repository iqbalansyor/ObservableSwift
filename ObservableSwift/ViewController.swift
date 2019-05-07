//
//  ViewController.swift
//  ObservableSwift
//
//  Created by Iqbal.ansyori on 07/05/19.
//  Copyright © 2019 Iqbal.ansyori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var isStringPassedLabel: UILabel!
    @IBOutlet weak var passStringButton: UIButton!
    @IBOutlet weak var isVoidPassedLabel: UILabel!
    @IBOutlet weak var passVoidButton: UIButton!
    
    let viewModel = ViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.stringPassed.subscribe(observer: self) { [weak self] (text) in
            self?.isStringPassedLabel.text = text
        }
        .triggerFirst()
        
        _ = viewModel.voidPassed.subscribe(observer: self) { [weak self] (_) in
            
            guard let `self` = self else {
                return
            }
            
            if (self.isVoidPassedLabel.text ==  "Void Passed") {
                self.isVoidPassedLabel.text = "Try this"
            } else {
            	self.isVoidPassedLabel.text = "Void Passed"
            }
        }
    }
    
    @IBAction func passString(_ sender: Any) {
        if (viewModel.stringPassed.value ==  "String Passed") {
            viewModel.stringPassed.value = "Try this"
        } else {
            viewModel.stringPassed.value = "String Passed"
        }
    }
    
    @IBAction func passVoid(_ sender: Any) {
        viewModel.voidPassed.next()
    }
    
}

