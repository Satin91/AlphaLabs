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
    let backgroundTwoView = OnboardingTwoBackgroundView()
    
    let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureActions()
    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
//        view.frame = view.frame.offsetBy(dx: 0, dy: 500)
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func configureActions() {
        backgroundOneView.onTapGesture = { [weak self] in
            UIView.animate(withDuration: 0.3, animations: {
                self?.scrollView.contentOffset.x = self?.view.bounds.width ?? 0
                    self?.view.layoutIfNeeded()
                }, completion: nil)
        }
        backgroundTwoView.onTapGesture = { [weak self] in
            self?.present(HomeViewController(), animated: true)
        }
    }
    
    
    func configureUI() {
        view.addSubview(backgroundTwoView)
        view.addSubview(scrollView)
        
        scrollView.contentSize = CGSize(width: view.bounds.width * 2, height: view.bounds.height)
        scrollView.isScrollEnabled = false
        scrollView.addSubview(backgroundOneView)
        scrollView.addSubview(backgroundTwoView)
        
        scrollView.snp.makeConstraints {
            $0.size.equalToSuperview()
        }
        backgroundOneView.snp.makeConstraints {
            $0.size.equalToSuperview()
        }
        backgroundTwoView.snp.makeConstraints {
            $0.size.equalToSuperview()
            $0.left.equalTo(view.bounds.width)
        }
    }
}
