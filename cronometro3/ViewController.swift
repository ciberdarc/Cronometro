//
//  ViewController.swift
//  cronometro3
//
//  Created by Alexis Araujo on 6/9/16.
//  Copyright © 2016 Alexis Araujo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var timer = NSTimer()
    var count = 0
    var pressedPlay = true
    let item = UINavigationItem(title:"Play")

    @IBOutlet weak var time: UILabel!
    @IBOutlet weak var toolbar: UIToolbar!
    
    
    func updateTime() {
        count += 1
        time.text = "\(count)"
    }
    @IBAction func play(sender: AnyObject) {
        if pressedPlay == true{
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: #selector(ViewController.updateTime), userInfo: nil, repeats: true)
            
            item.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Pause, target: self, action: #selector(ViewController.play(_:)))
            toolbarItems = [item.leftBarButtonItem!]
            self.toolbar.setItems([item.leftBarButtonItem!], animated: true)
            pressedPlay = false
        }
        else{
            timer.invalidate()
            item.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Play, target: self, action: #selector(ViewController.play(_:)))
            toolbarItems = [item.leftBarButtonItem!]
            self.toolbar.setItems([item.leftBarButtonItem!], animated: true)
            pressedPlay = true
        }
        
    }
    
    @IBAction func stop(sender: AnyObject) {
        timer.invalidate()
        time.text = "0"
        count = 0
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

