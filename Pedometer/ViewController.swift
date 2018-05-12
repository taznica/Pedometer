//
//  ViewController.swift
//  Pedometer
//
//  Created by Taichi Tsuchida on 2018/05/12.
//  Copyright © 2018年 Taichi Tsuchida. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {

    @IBOutlet var stepsLabel: UILabel!

    let pedometer: CMPedometer = CMPedometer()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        getSteps()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func getSteps() {
        if !(CMPedometer.isStepCountingAvailable()) {
            return
        }

        pedometer.startUpdates(from: Date(), withHandler: { (data: CMPedometerData?, error) in
            DispatchQueue.main.async {
                if let e = error {
                    print(e.localizedDescription)
                }
                let steps = data!.numberOfSteps
                self.stepsLabel.text = steps.stringValue
            }
        })
    }
}

