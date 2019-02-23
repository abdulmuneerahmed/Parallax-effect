//
//  TableCell.swift
//  MotionDetector
//
//  Created by admin on 23/02/19.
//  Copyright © 2019 AcknoTech. All rights reserved.
//

import UIKit

class MyCell:UITableViewCell{
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier:   reuseIdentifier)
        setup()
        setupParallax()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupParallax()
    }
    
    lazy var parallaxImage: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "img1")
//        image.contentMode = .as
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    lazy var label:UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenirnext-Heavyitalic", size: 30)
        label.text = "Camera"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.backgroundColor = UIColor(white: 0, alpha: 0.3)
        label.textColor = .white
        return label
    }()
    
    func setup(){
        addSubview(parallaxImage)
        parallaxImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        parallaxImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        parallaxImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        parallaxImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
        
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0).isActive = true
        label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0).isActive = true
    }
    
    func configureCell(celldata data:Data){
        parallaxImage.image = UIImage(named: data.imageView)
        label.text = data.label
    }
    
    func setupParallax(){
        let min = CGFloat(-20)
        let max = CGFloat(20)
        
        let xMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.x", type: .tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = min
        xMotion.maximumRelativeValue = max
        
        let yMotion = UIInterpolatingMotionEffect(keyPath: "layer.transform.translation.y", type: .tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = min
        yMotion.maximumRelativeValue = max
        
        let motionGroup = UIMotionEffectGroup()
        motionGroup.motionEffects = [yMotion]
        parallaxImage.addMotionEffect(motionGroup)
    }
}

extension UIImage{
    func getCropRatio() -> CGFloat{
        let widthratio = CGFloat(self.size.width/self.size.height)
//        print(self.size.width,self.size.height)
        return widthratio
    }
}
