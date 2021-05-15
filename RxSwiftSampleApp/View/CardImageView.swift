//
//  CardImageView.swift
//  RxSwiftSampleApp
//
//  Created by hideto c. on 2021/05/16.
//

import UIKit

class CardImageView: UIImageView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        backgroundColor = .blue
        layer.cornerRadius = 10
        contentMode = .scaleAspectFill
        image = UIImage(named: "testImage")
        clipsToBounds = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
