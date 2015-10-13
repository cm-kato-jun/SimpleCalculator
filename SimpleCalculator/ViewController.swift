//
//  ViewController.swift
//  SimpleCalculator
//
//  Created by kato.jun on 2015/10/13.
//  Copyright © 2015年 kato.jun. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var result: UILabel!
    
    @IBOutlet weak var multiplicationButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var dotButton: UIButton!
    
    // 演算子の左側の値
    private var leftValue: String? = nil
    // 演算子の右側の値
    private var rightValue: String? = nil
    // 演算子
    private var op: String? = nil
    
    // MARK: Lyfecycle Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.initialize()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Actions
    
    // 数字ボタンタップ
    @IBAction func userDidTapNumberButton(sender: UIButton) {
        let number = sender.currentTitle!
        self.result.text! += number
        
        if self.leftValue == nil {
            self.leftValue = number
            return
        }
        
        if self.op == nil {
            self.leftValue! += number
            return
        }
        
        if self.rightValue == nil {
            self.rightValue = number
        } else {
            self.rightValue! += number
        }
    }
    
    // =ボタンタップ
    @IBAction func userDidTapEqualButton(sender: UIButton) {
        
        if self.leftValue == nil {
            return
        }
        if self.op == nil {
            return
        }
        if self.rightValue == nil {
            return
        }
        
        switch self.op! {
        case "+":
            self.result.text = "\(Int(self.leftValue!)! + Int(self.rightValue!)!)"
            break
        case "-":
            self.result.text = "\(Int(self.leftValue!)! - Int(self.rightValue!)!)"
            break
        default:
            break
        }
        
        let currentNumber = self.result.text
        self.initialize()
        
        // 続けて計算できるように計算結果を左辺に保存
        self.leftValue = currentNumber
        self.result.text! = currentNumber!
    }
    
    // DELボタンタップ
    @IBAction func userDidTapDeleteButton(sender: UIButton) {
        self.initialize()
    }
    
    // 加算
    @IBAction func userDidTapAdditionButton(sender: UIButton) {
        if self.rightValue != nil {
            userDidTapEqualButton(sender)
        }
        
        self.op = sender.currentTitle!
        self.result.text! += self.op!
    }
    
    // 引き算
    @IBAction func userDidTapSubtractionButton(sender: UIButton) {
        if self.rightValue != nil {
            userDidTapEqualButton(sender)
        }
        
        self.op = sender.currentTitle!
        self.result.text! += self.op!
    }
    
    // MARK: Private Methods
    
    // 初期化
    private func initialize() {
        self.multiplicationButton.hidden = true
        self.divisionButton.hidden = true
        self.dotButton.hidden = true
        self.result.text! = ""
        self.leftValue = nil
        self.rightValue = nil
        self.op = nil
        self.result.text! = ""
    }
}

