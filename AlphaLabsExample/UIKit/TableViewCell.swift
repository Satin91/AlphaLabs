//
//  TableViewCell.swift
//  AlphaLabsExample
//
//  Created by Артур Кулик on 08.09.2024.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {
    
    let randomColors: [UIColor] = [.systemRed, .systemOrange, .systemYellow, .systemGreen, .systemBlue]
    
    var image = UIImageView()
    var title = UILabel()
    var subtitle = UILabel()
    var chevron = UIImageView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configuireUI()
    }
    
    func configuire(model: EatModel) {
        image.image = UIImage(
            systemName: model.imageName,
            withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 12, weight: .light)))!.withTintColor(randomColors.randomElement()!,
            renderingMode: .alwaysOriginal
        )
        chevron.image = UIImage(
            systemName: "chevron.right",
            withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 14,
            weight: .bold)))?.withTintColor(randomColors.randomElement()!,renderingMode: .alwaysOriginal)
        chevron.contentMode = .scaleAspectFit
        title.text = model.title
        subtitle.text = model.subtitle
  
    }
    
    private func configuireUI() {
        contentView.addSubview(image)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        contentView.addSubview(chevron)
        
        let separator = UIView()
        separator.backgroundColor = .hex(hex: "D5DEE7")
        backgroundColor = .clear
        addSubview(separator)
        
        title.font = .systemFont(ofSize: 18, weight: .semibold)
        subtitle.font = .systemFont(ofSize: 14)
        subtitle.textColor = .hex(hex: "3E3E3F").withAlphaComponent(0.5)
        contentView.frame = contentView.frame.insetBy(dx: .zero, dy: 16)
        image.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 40, height: 40))
            $0.left.equalTo(20)
            $0.centerY.equalTo(contentView.snp.centerY)
        }
        
        chevron.snp.makeConstraints {
            $0.size.equalTo(CGSize(width: 18, height: 18))
            $0.centerY.equalTo(contentView.snp.centerY)
            $0.right.equalTo(contentView.snp.right).inset(24)
        }
        
        title.snp.makeConstraints {
            $0.left.equalTo(image.snp.right).inset(-14)
            $0.right.equalTo(chevron.snp.left).inset(-8)
            $0.top.equalTo(contentView.snp.top).inset(8)
        }
        
        subtitle.snp.makeConstraints {
            $0.left.equalTo(image.snp.right).inset(-14)
            $0.top.equalTo(title.snp.bottom).inset(-8)
            $0.right.equalTo(chevron.snp.left).inset(-8)
        }
        
        separator.snp.makeConstraints {
            $0.height.equalTo(1)
            $0.left.right.equalToSuperview()
            $0.bottom.equalTo(snp.bottom)
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
