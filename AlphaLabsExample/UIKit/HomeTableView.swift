//
//  HomeTableView.swift
//  AlphaLabsExample
//
//  Created by Артур Кулик on 08.09.2024.
//

import UIKit

class HomeTableView: UITableView, UITableViewDelegate, UITableViewDataSource {
    var items: [EatModel] = []
    
    var onTapRow: ((Int) -> Void)?
    
    convenience init(items: [EatModel]) {
        self.init(frame: .zero, style: .plain)
        self.items = items
    }
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        configureUI()
        registerCell()
        assignDelegate()
    }
    
    private func configureUI() {
        backgroundColor = .clear
        separatorStyle = .none
    }
    
    private func registerCell() {
        self.register(TableViewCell.self, forCellReuseIdentifier: "tableViewCell")
    }
    
    private func assignDelegate() {
        self.delegate = self
        self.dataSource = self
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 72
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        onTapRow?(indexPath.row)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.dequeueReusableCell(withIdentifier: "tableViewCell", for: indexPath) as! TableViewCell
        cell.configuire(model: items[indexPath.row])
        cell.selectionStyle = .none
        return cell
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
