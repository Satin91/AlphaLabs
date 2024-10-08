//
//  Onboarding1Background.swift
//  AlphaLabsExample
//
//  Created by Артур Кулик on 07.09.2024.
//

import UIKit
import SnapKit

class OnboardingOneBackgroundView: UIView {
    var onTapGesture: () -> Void = {}
    
    var bottomView: OnboardingBottomView!
    
    var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "onboarding1Image")!)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        initializeBottomView()
        configureUI()
    }
    
    func initializeBottomView() {
        bottomView = OnboardingBottomView(
            title: "Extensive Food Selection & More",
            text: "Welcome to our food delivery service! Explore our extensive selection of restaurants and dishes, and simply add your desired items to the cart when you're ready to order. Checkout is a breeze!",
            leftText: "Skip",
            rightText: "Next"
        )
        bottomView.onTapGesture = { [weak self] in
            self?.onTapGesture()
        }
    }
    
    func configureUI() {
        backgroundColor = UIColor.hex(hex: "D5EAEF")
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.width.left.equalTo(47)
            $0.width.right.equalTo(-47)
            $0.height.equalTo(296)
            $0.top.equalTo(86)
        }
        addSubview(bottomView)
        bottomView.snp.makeConstraints {
            $0.top.equalTo(imageView.snp.bottom).inset(-38)
            $0.left.right.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
