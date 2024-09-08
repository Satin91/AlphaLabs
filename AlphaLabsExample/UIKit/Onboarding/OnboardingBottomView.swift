//
//  OnboardingBottomView.swift
//  AlphaLabsExample
//
//  Created by Артур Кулик on 07.09.2024.
//

import UIKit
import SnapKit

class OnboardingBottomView: UIView {
    
    var titleLabel = UILabel()
    var textLabel = UILabel()
    
    var leftButton = UIButton(type: .system)
    var rightButton = UIButton(type: .system)
    
    var leftButtonText = String()
    var rightButtonText = String()
    
    var titleText = String()
    var subtitleText = String()
    
    
    convenience init(title: String, text: String, leftText: String, rightText: String) {
        self.init(frame: CGRect.zero)
        configureLabels(title: title, text: text, leftText: leftText, rightText: rightText)
        configureUI()
        makeConstraints()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    func configureLabels(title: String, text: String, leftText: String, rightText: String) {
        titleText = title
        subtitleText = text
        leftButtonText = leftText
        rightButtonText = rightText
    }
    
    func configureUI() {
        backgroundColor = .white
        layer.cornerRadius = 24
        layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        clipsToBounds = true
        setupButtons()
        
        titleLabel.textColor = .black
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.text = titleText
        titleLabel.numberOfLines = 0
        
        textLabel.textColor = .hex(hex: "3E3E3F")
        textLabel.font = .systemFont(ofSize: 17, weight: .light)
        textLabel.text = "Welcome to our food delivery service! Explore our extensive selection of restaurants and dishes, and simply add your desired items to the cart when you're ready to order. Checkout is a breeze!"
        textLabel.numberOfLines = 0
    }
    
    
    func setupButtons() {
        var configuration = UIImage.SymbolConfiguration(font: .systemFont(ofSize: 14))
        
        let leftButtonImage = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 12)))!.withTintColor(.black, renderingMode: .alwaysOriginal)
        let rightButtonImage = UIImage(systemName: "chevron.right", withConfiguration: UIImage.SymbolConfiguration(font: .systemFont(ofSize: 12)))!.withTintColor(.white, renderingMode: .alwaysOriginal)
        
        leftButton.setTitle(leftButtonText, for: .normal)
        leftButton.setTitleColor(.hex(hex: "222222"), for: .normal)
        leftButton.setImage(leftButtonImage, for: .normal)
        leftButton.semanticContentAttribute = .forceRightToLeft
        leftButton.backgroundColor = .clear

        
        rightButton.backgroundColor = .hex(hex: "F74E49")
        rightButton.layer.cornerRadius = 18
        rightButton.setTitle(rightButtonText, for: .normal)
        rightButton.setTitleColor(.white, for: .normal)
        rightButton.semanticContentAttribute = .forceRightToLeft
        rightButton.setImage(rightButtonImage, for: .normal)
    }
    
    func makeConstraints() {
        addSubview(titleLabel)
        addSubview(textLabel)
        addSubview(leftButton)
        addSubview(rightButton)
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(37)
            $0.left.equalTo(21)
            $0.right.equalTo(-21)
        }
        
        textLabel.snp.makeConstraints {
            $0.left.equalTo(21)
            $0.right.equalTo(-21)
            $0.top.equalTo(titleLabel.snp.bottom).inset(-8)
        }
        
        rightButton.snp.makeConstraints {
            $0.bottom.equalTo(-46)
            $0.right.equalTo(-21)
            $0.height.equalTo(64)
            $0.width.equalTo(183)
        }
        
        leftButton.snp.makeConstraints {
            $0.bottom.equalTo(-46)
            $0.left.equalTo(21)
            $0.right.equalTo(rightButton.snp.left).inset(-8)
            $0.height.equalTo(64)
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
