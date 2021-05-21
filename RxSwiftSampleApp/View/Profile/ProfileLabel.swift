//
//  ProfileLabel.swift
//  RxSwiftSampleApp
//
//  Created by hideto c. on 2021/05/22.
//

import UIKit

class ProfileLabel: UILabel {
    
    init() {
        super.init(frame: .zero)
        
        self.font = .systemFont(ofSize: 40, weight: .bold)
        self.textColor = .black
    }
    
    // InfoCollectionViewCellのtitleLabel
    init(title: String) {
        super.init(frame: .zero)
        
        self.text = title
        self.textColor = .darkGray
        self.font = .systemFont(ofSize: 14)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
