//
//  Structure.swift
//  MotionDetector
//
//  Created by admin on 23/02/19.
//  Copyright © 2019 AcknoTech. All rights reserved.
//

import Foundation

struct Data {
    let imageView:String
    let label:String
}

struct CellData {
    static let instance = CellData()
    var data = [
        Data(imageView: "img1", label: "Computer"),
        Data(imageView: "img2", label: "Desktop"),
        Data(imageView: "img3", label: "Analysis"),
        Data(imageView: "img4", label: "Pixels"),
        Data(imageView: "img5", label: "City")
    ]
    
    func getData() -> [Data]{
        return data
    }
}
