//
//  ViewController.swift
//  gesture_lab7
//
//  Created by Admin on 20.05.17.
//  Copyright © 2017 Oleg Kiselevich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var gestureIndicator: UILabel!
    
    @IBAction func tap(_ sender: Any)
    {
        gestureIndicator.text = "Жест: касание\n Цвет фона: зеленый";
        gestureIndicator.backgroundColor = UIColor.green
    }
    
    @IBAction func pinch(_ sender: Any)
    {
        gestureIndicator.text = "Жест: масштабирование\n Цвет фона: красный";
        gestureIndicator.backgroundColor = UIColor.red
    }
    
    @IBAction func rotation(_ sender: Any)
    {
        gestureIndicator.text = "Жест: вращение\n Цвет фона: синий";
        gestureIndicator.backgroundColor = UIColor.blue
    }
    
    @IBAction func swipe(_ sender: Any)
    {
        gestureIndicator.text = "Жест: смахивание\n Цвет фона: серый";
        gestureIndicator.backgroundColor = UIColor.lightGray
    }
    
    @IBAction func longPress(_ sender: Any)
    {
        gestureIndicator.text = "Жест: долгое нажатие\n Цвет фона: оранжевый";
        gestureIndicator.backgroundColor = UIColor.orange
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        gestureIndicator.isUserInteractionEnabled = true
        gestureIndicator.textAlignment = NSTextAlignment.center
        
        gestureIndicator.numberOfLines = 2; gestureIndicator.text = "Используйте жесты в этой области";
        gestureIndicator.backgroundColor = UIColor.yellow
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

