//
//  Onboarding2BackgroundView.swift
//  AlphaLabsExample
//
//  Created by Артур Кулик on 07.09.2024.
//

import UIKit

class OnboardingTwoBackgroundView: UIView {
    var onTapGesture: () -> Void = {}
   
    var bottomView: OnboardingBottomView!
    
    var imageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "onboarding2Image")!)
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
            title: "Let's Begin your Food Order",
            text: "Welcome! To start exploring our selection of delicious meals from your favorite restaurants, please create an account or sign in to your existing one.",
            leftText: "Skip",
            rightText: "Continue"
        )
        bottomView.onTapGesture = { [weak self] in
            self?.onTapGesture()
        }
    }
    
    func configureUI() {
        self.addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.width.left.equalTo(59)
            $0.width.right.equalTo(-59)
            $0.height.equalTo(296)
            $0.top.equalTo(89)
        }
        backgroundColor = UIColor.hex(hex: "A9DCE6")
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
