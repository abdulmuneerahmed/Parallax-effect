//
//  ParallexVC.swift
//  MotionDetector
//
//  Created by admin on 23/02/19.
//  Copyright © 2019 AcknoTech. All rights reserved.
//

import UIKit

class ParallaxVC:UIViewController{
    
    
    
    override func loadView() {
        super.loadView()
        view.backgroundColor = .white
        setup()
    }
    
    lazy var tableview:UITableView = {
        let table = UITableView()
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.showsHorizontalScrollIndicator = false
        table.translatesAutoresizingMaskIntoConstraints = false
        return table
    }()
    
    func setup(){
        
        
        view.addSubview(tableview)
        tableview.delegate = self
        tableview.dataSource = self
        tableview.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        tableview.register(MyCell.self, forCellReuseIdentifier: "cell")
    }
}

extension ParallaxVC: UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return CellData.instance.getData().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableview.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyCell else {
            return MyCell()
        }
        cell.configureCell(celldata: CellData.instance.data[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if let currentImage = UIImage(named: CellData.instance.data[indexPath.row].imageView){
            let imageCrop = currentImage.getCropRatio()
//            print(tableView.frame.width/imageCrop)
            return tableView.frame.width / imageCrop
        }
        return 100
    }
}
