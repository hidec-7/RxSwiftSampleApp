//
//  TopControlView.swift
//  RxSwiftSampleApp
//
//  Created by hideto c. on 2021/05/07.
//

import UIKit

class TopControlView: UIView {
    
    let tinderButton = createTopButton(imageName: "tinder")
    let goodButton = createTopButton(imageName: "good")
    let commentButton = createTopButton(imageName: "comment")
    let profileButton = createTopButton(imageName: "people")
    
    static private func createTopButton(imageName: String) -> UIButton {
        let button = UIButton(type: .custom)
        button.setImage(UIImage(named: imageName), for: .normal)
        button.imageView?.contentMode = .scaleAspectFit
//        button.setTitle("tap", for: .normal)
        
        return button
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let baseStackView = UIStackView(arrangedSubviews: [tinderButton, goodButton, commentButton, profileButton])
        baseStackView.axis = .horizontal
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 43
        baseStackView.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(baseStackView)
        
        [baseStackView.topAnchor.constraint(equalTo: topAnchor),
         baseStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
         baseStackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 40),
         baseStackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -40)
        ].forEach{ $0.isActive = true }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
