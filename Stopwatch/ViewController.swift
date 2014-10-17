//
//  ViewController.swift
//  Stopwatch
//
//  Created by Gerardo Camilo on 16/10/14.
//  Copyright (c) 2014 ___GRCS___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0
    var timer = NSTimer()
    @IBOutlet weak var lblTime: UILabel!
    
    @IBAction func reset(sender: AnyObject) {
        resetTimer()
    }
    
    @IBAction func play(sender: AnyObject) {
        startTimer()
    }
    
    @IBAction func pause(sender: AnyObject) {
        pauseTimer()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func startTimer() {
        
        if !self.timer.valid {
            self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "intervalAction", userInfo: nil, repeats: true)
        }
    }
    
    func intervalAction(){
        increaseCounter()
        updateTime()
    }
    
    func pauseTimer(){
        if self.timer.valid {
            self.timer.invalidate()
        }
    }

    func increaseCounter(){
        var actualCounter = getCounter()
        setCounter(++actualCounter)
    }
    
    func resetCounter(){
        setCounter(0)
    }
    
    func setCounter(value:Int){
        self.counter = value
    }
    
    func getCounter() -> Int{
        return counter
    }
    
    func updateTime(){
        lblTime.text = String(getCounter())
    }
    
    func resetTimer(){

        pauseTimer()
        resetCounter()
        updateTime()
        
    }

}

