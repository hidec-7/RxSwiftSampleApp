//
//  ProfileTextField.swift
//  RxSwiftSampleApp
//
//  Created by hideto c. on 2021/05/22.
//

import UIKit

class ProfileTextField: UITextField {
    
    init(placeholder: String) {
        super.init(frame: .zero)
        
        self.borderStyle = .roundedRect
        self.placeholder = placeholder
        self.backgroundColor = .rgb(red: 245, green: 245, blue: 245)
        self.textColor = .black
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
