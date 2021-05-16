//
//  LoginViewController.swift
//  RxSwiftSampleApp
//
//  Created by hideto c. on 2021/05/16.
//

import UIKit
import RxSwift
import FirebaseAuth

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    private let disposeBag = DisposeBag()
    
    // MARK: UIViews
    private let titleLabel = RegisterTitleLabel(text: "LOGIN")
    private let emailTextField = RegisterTextField(placeHolder: "email")
    private let passwordTextField = RegisterTextField(placeHolder: "password")
    private let loginButton = RegisterButton(text: "ログイン")
    private let dontHaveButton = UIButton(type: .system).createAboutAccountButton(text: "アカウントをお持ちでない場合はこちら")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        setupGardientLayer()
        setupLayout()
        setupBindings()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        emailTextField.text = textField.text
        passwordTextField.text = textField.text
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func setupGardientLayer() {
        let layer = CAGradientLayer()
        let startColor = UIColor.rgb(red: 227, green: 48, blue: 78).cgColor
        let endColor = UIColor.rgb(red: 245, green: 208, blue: 108).cgColor
        
        layer.colors = [startColor, endColor]
        layer.locations = [0.0, 1.3]
        layer.frame = view.bounds
        view.layer.addSublayer(layer)
    }
    
    private func setupLayout() {
        passwordTextField.isSecureTextEntry = true
        
        let baseStackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        baseStackView.axis = .vertical
        baseStackView.distribution = .fillEqually
        baseStackView.spacing = 20
        
        view.addSubview(baseStackView)
        view.addSubview(titleLabel)
        view.addSubview(dontHaveButton)
        
        emailTextField.anchor(height: 45)
        baseStackView.anchor(left: view.leftAnchor, right: view.rightAnchor, centerY: view.centerYAnchor, leftPadding: 45, rightPadding: 45)
        titleLabel.anchor(bottom: baseStackView.topAnchor, centerX: view.centerXAnchor, bottomPadding: 20)
        dontHaveButton.anchor(top: baseStackView.bottomAnchor, centerX: view.centerXAnchor, topPadding: 20)
    }
    
    private func setupBindings() {
        dontHaveButton.rx.tap
            .asDriver()
            .drive { [weak self] text in
                self?.navigationController?.popViewController(animated: true)
            }
            .disposed(by: disposeBag)
        
        loginButton.rx.tap
            .asDriver()
            .drive { [weak self] text in
                self?.loginWithFireAuth()
            }
            .disposed(by: disposeBag)
    }
    
    private func loginWithFireAuth() {
        let email = emailTextField.text ?? ""
        let password = passwordTextField.text ?? ""
        
        Auth.auth().signIn(withEmail: email, password: password) { (res, err) in
            if let err = err {
                print("ログインに失敗: ", err)
                return
            }
            print("ログインに成功")
            self.dismiss(animated: true, completion: nil)
        }
    }
}
