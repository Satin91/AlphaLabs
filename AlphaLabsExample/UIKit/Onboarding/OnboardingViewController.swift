//
//  OnboardingViewController.swift
//  AlphaLabsExample
//
//  Created by Артур Кулик on 07.09.2024.
//

import UIKit
import SnapKit

class OnboardingViewController: UIViewController {
    
    let backgroundOneView = OnboardingOneBackgroundView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        view.addSubview(backgroundOneView)
        backgroundOneView.snp.makeConstraints {
            $0.size.equalToSuperview()
        }
    }
}
