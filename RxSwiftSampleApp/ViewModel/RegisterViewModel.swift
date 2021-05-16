//
//  RegisterViewModel.swift
//  RxSwiftSampleApp
//
//  Created by hideto c. on 2021/05/16.
//

import Foundation
import RxSwift

class RegisterViewModel {
    
    private let disposeBag = DisposeBag()
    
    // MARK: observable
    var nameTextOutput = PublishSubject<String>()
    var emailTextOutput = PublishSubject<String>()
    var passwordTextOutput = PublishSubject<String>()
    
    // MARK: observer
    var nameTextInput: AnyObserver<String> {
        nameTextOutput.asObserver()
    }
    var emailTextInput: AnyObserver<String> {
        emailTextOutput.asObserver()
    }
    var passwordTextInput: AnyObserver<String> {
        passwordTextOutput.asObserver()
    }
    
    init() {
        nameTextOutput
            .asObserver()
            .subscribe { text in
                print("name: ", text)
            }
            .disposed(by: disposeBag)
        
        emailTextOutput
            .asObserver()
            .subscribe { text in
                print("email: ", text)
            }
            .disposed(by: disposeBag)
        
        passwordTextOutput
            .asObserver()
            .subscribe { text in
                print("password: ", text)
            }
            .disposed(by: disposeBag)
    }
}
