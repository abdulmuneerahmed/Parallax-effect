//
//  ViewController.swift
//  MotionDetector
//
//  Created by admin on 23/02/19.
//  Copyright © 2019 AcknoTech. All rights reserved.
//

import UIKit
import CoreMotion
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setup()
        motionManager = CMMotionManager()
        motionManager.startAccelerometerUpdates(to: .main, withHandler: updateLabels)
    }
    var motionManager:CMMotionManager!
    lazy var labelX:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenirnext-Medium", size: 40)
        label.text = "X:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .orange
        return label
    }()
    
    lazy var labelY:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenirnext-Medium", size: 40)
        label.text = "Y:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .green
        return label
    }()
    
    lazy var labelZ:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenirnext-Medium", size: 40)
        label.text = "Z:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .cyan
        return label
    }()

    func setup(){
    
        let stackview = UIStackView(arrangedSubviews: [labelX,labelY,labelZ])
        stackview.axis = .vertical
        stackview.distribution = .fillEqually
        stackview.alignment  = .center
        stackview.spacing = 10
        stackview.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(stackview)
        NSLayoutConstraint.activate([
            stackview.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            stackview.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            stackview.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0),
            stackview.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0)
            ])
    }
    
    func updateLabels(data:CMAccelerometerData?,error:Error?){
        guard let accelerometerData = data else {
            return
        }
        print(accelerometerData)
        
        let formatter = NumberFormatter()
        formatter.minimumFractionDigits = 1
        formatter.maximumFractionDigits = 1
        let x = formatter.string(for: accelerometerData.acceleration.x)!
        let y = formatter.string(for: accelerometerData.acceleration.y)!
        let z = formatter.string(for: accelerometerData.acceleration.z)!
        
        labelX.text = "X: \(x)"
        labelY.text = "Y: \(y)"
        labelZ.text = "Z: \(z)"
    }
}

