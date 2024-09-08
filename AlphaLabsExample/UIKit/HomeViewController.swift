//
//  ViewController.swift
//  AlphaLabsExample
//
//  Created by Артур Кулик on 07.09.2024.
//

import UIKit
import SnapKit

class HomeViewController: UIViewController {
    var tableView: HomeTableView!
    var header: UILabel = {
        let label = UILabel()
        label.text = "UIKit TableView"
        label.font = .systemFont(ofSize: 30, weight: .bold)
        return label
    }()
    
    
    let tableViewItems: [
        EatModel] = [
            .init(imageName: "bus",
                  title: "Centery in the dictionary",
                  subtitle: "Affiliated agents strong in 80+ countries and territories."),
            .init(imageName: "car",
                  title: "The family originates from",
                  subtitle: "Century is a family of serif type faces particularly intended for body text"),
            .init(imageName: "car.top.radiowaves.rear.left.fill",
                  title: "Currently we have no translations",
                  subtitle: "The Republic of Centery is a large, safe nation, notable for its burgeoning"),
            .init(imageName: "creditcard.fill",
                  title: "In historical contexts, a century is ",
                  subtitle: "This graph shows how century have occurred between 1800 and 2008"),
        ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureUI()
        initTableView()
        makeConstraints()
    }
    
    func initTableView() {
        tableView = HomeTableView(items: tableViewItems)
        tableView.onTapRow = { row in
            print(row)
        }
    }
    
    func makeConstraints() {
        view.addSubview(tableView)
        view.addSubview(header)
        
        header.snp.makeConstraints {
            $0.height.equalTo(120)
            $0.top.equalToSuperview().inset(40)
            $0.left.right.equalToSuperview().inset(24)
        }
        
        tableView.snp.makeConstraints {
            $0.top.equalTo(header.snp.bottom)
            $0.size.equalToSuperview()
        }
    }
    
    func configureUI() {
        self.view.backgroundColor = .white
    }
}

