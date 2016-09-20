//
//  ViewController.swift
//  Multiples
//
//  Created by Peter Zaporowski on 20.09.2016.
//  Copyright © 2016 Peter Zaporowski. All rights reserved.
//  made using Mark Price's example from Udemy iOS 9 course

import UIKit

class ViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var whatMultipleTxt: UITextField!
    @IBOutlet weak var sumLbl: UILabel!
    @IBOutlet weak var logoImg: UIImageView!
    @IBOutlet weak var addBtn: UIButton!
    @IBOutlet weak var playBtn: UIButton!
    
    //Properties
    var multiple = 0
    var runningSum = 0
    let MAX_SUM = 100
    
    
    @IBAction func onAddBtnTapped(sender: AnyObject) {
        //Since we never change the newSum value make it a constant
        let newSum = runningSum + multiple
        updateLbl(runningSum, mul: multiple, newSum: newSum)
        runningSum += multiple
        
        if isGameOver() {
            restartGame()
        }
    }
    
    @IBAction func onPlayBtnTapped(sender: AnyObject) {
        
        if whatMultipleTxt.text != nil && whatMultipleTxt.text != "" {
            
            whatMultipleTxt.hidden = true
            logoImg.hidden = true
            playBtn.hidden = true
            sumLbl.hidden = false
            addBtn.hidden = false
            
            resetLbl()
            multiple = Int(whatMultipleTxt.text!)!
            runningSum = 0
        }
    }
    
    func restartGame() {
        multiple = 0
        whatMultipleTxt.text = ""
        whatMultipleTxt.hidden = false
        logoImg.hidden = false
        playBtn.hidden = false
        sumLbl.hidden = true
        addBtn.hidden = true
        resetLbl()
    }
    
    func resetLbl() {
        sumLbl.text = "Naciśnij Dodaj!"
    }
    
    func isGameOver() -> Bool {
        if runningSum >= MAX_SUM {
            return true
        } else {
            return false
        }
    }
    
    func updateLbl(oldSum: Int, mul: Int, newSum: Int) {
        sumLbl.text = "\(oldSum) + \(mul) = \(newSum)"
    }
    
    
}

