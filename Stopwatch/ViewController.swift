//
//  ViewController.swift
//  Stopwatch
//
//  Created by Gerardo Camilo on 16/10/14.
//  Copyright (c) 2014 ___GRCS___. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblTime: UILabel!
    var i = 1
    var timer = NSTimer()
    
    @IBOutlet weak var btnTrigger: UIButton!
    
    @IBAction func startTimer(sender: AnyObject) {
        
        if self.timer.valid {
            
            self.timer.invalidate()
            btnTrigger.setTitle("Start", forState: UIControlState.Normal)
        }else{
            
            self.timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "updateTime", userInfo: nil, repeats: true)
            btnTrigger.setTitle("Stop", forState: UIControlState.Normal)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }

    func updateTime(){
        
        lblTime.text = String(i)
        i++
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

