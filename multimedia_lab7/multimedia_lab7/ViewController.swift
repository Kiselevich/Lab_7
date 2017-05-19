//
//  ViewController.swift
//  multimedia_lab7
//
//  Created by Admin on 20.05.17.
//  Copyright © 2017 Oleg Kiselevich. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var switchIndicatorLabel: UILabel!
    @IBOutlet var backgroundSwitch: UISwitch!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        switchIndicatorLabel.textColor = UIColor.white;
        switchIndicatorLabel.text = "Background Image: bg2.jpg";
        view.backgroundColor = UIColor(patternImage:UIImage(named:"bg2")!);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func backgroundSwitchTapped(_ sender: Any) {
        if backgroundSwitch.isOn
        {
            switchIndicatorLabel.text = "Background Image: bg1.jpg";
            view.backgroundColor = UIColor(patternImage: UIImage(named:"bg1")!);
        }
        else
        {
            switchIndicatorLabel.text = "Background Image: bg2.jpg";
            view.backgroundColor = UIColor(patternImage: UIImage(named:"bg2")!);
        }
    }

}

