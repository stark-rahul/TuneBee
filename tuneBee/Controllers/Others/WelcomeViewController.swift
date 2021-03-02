//
//  WelcomeViewController.swift
//  tuneBee
//
//  Created by Rahul on 23/02/21.
//

import UIKit

class WelcomeViewController: UIViewController {
    private let signInButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .black
        button.setTitle("Sign in with credentials", for: .normal)
        button.setTitleShadowColor(.darkGray, for: .normal)
        return button
    }()
   
   

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "TuneBee"
        view.backgroundColor = .systemRed
        view.addSubview(signInButton)
        signInButton.addTarget(self, action: #selector(didTapSignIn), for: .touchUpInside)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        signInButton.frame = CGRect(x: 20,
                                    y: view.height - 50 - view.safeAreaInsets.bottom,
                                    width: view.width - 40,
                                    height: 50
        )
    }
    
    @objc func didTapSignIn() {
        let vc = AuthViewController()
        vc.completionHandler = { [weak self] success in
            DispatchQueue.main.async {
                self?.handleSignIn(success: success)
            }
            
        }
        vc.navigationItem.largeTitleDisplayMode = .never
        navigationController?.pushViewController(vc, animated: true)
    }
    private func handleSignIn(success: Bool) {
        //Log user in or yell at them for error
    }
}
