//
//  HomeViewController.swift
//  RxSwiftSampleApp
//
//  Created by hideto c. on 2021/05/06.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLayout()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            let registerController = RegisterViewController()
            registerController.modalPresentationStyle = .fullScreen
            self.present(registerController, animated: true)
        }
    }

    private func setupLayout() {
        view.backgroundColor = .white
        
        let topControlView = TopControlView()
        
        let cardView = CardView()
        
        let BottomView = BottomControlView()
        
        let stackView = UIStackView(arrangedSubviews: [topControlView, cardView, BottomView])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        
        self.view.addSubview(stackView)
        
        [topControlView.heightAnchor.constraint(equalToConstant: 100),
         BottomView.heightAnchor.constraint(equalToConstant: 120),
         
         stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         stackView.leftAnchor.constraint(equalTo: view.leftAnchor),
         stackView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ].forEach{ $0 .isActive = true }
    }
}

