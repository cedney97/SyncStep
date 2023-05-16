//
//  ViewController.swift
//  SyncStep
//
//  Created by Cade Edney on 5/13/23.
//

import UIKit

class LandingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpComponents()
    }
    
    func setUpComponents() {
        // Background
        self.view.backgroundColor = Colors.lightSkyBlue
        
        // Set up Headphones
        let headphonesView = UIImageView(image: UIImage(named: "Headphones"))
        
        view.addSubview(headphonesView)
        headphonesView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            headphonesView.widthAnchor.constraint(equalToConstant: 175),
            headphonesView.heightAnchor.constraint(equalToConstant: 175),
            headphonesView.centerXAnchor.constraint(equalTo: view.leadingAnchor, constant: 75),
            headphonesView.centerYAnchor.constraint(equalTo: view.topAnchor, constant: 103)
        ])
        
        // Set up Headphones Cord
        let cordView = UIImageView(image: UIImage(named: "HeadphoneCord"))
        cordView.layer.zPosition = headphonesView.layer.zPosition - 1   // Moves cord behind headphones
        
        view.addSubview(cordView)
        
        cordView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cordView.widthAnchor.constraint(equalToConstant: 292),
            cordView.heightAnchor.constraint(equalToConstant: 595),
            cordView.leadingAnchor.constraint(equalTo: headphonesView.leadingAnchor, constant: 57.5),
            cordView.topAnchor.constraint(equalTo: headphonesView.bottomAnchor, constant: -31),
        ])
        
        // Set up SyncStep attributed string
        let syncStepText = NSMutableAttributedString(string: "SyncStep")
        
        // Set font to Falcon Punch 48
        syncStepText.addAttribute(NSAttributedString.Key.font,
                                  value: UIFont(name: "FalconPunch", size: 48)!,
                                  range: NSRange(location: 0, length: syncStepText.length))
        
//        // Add drop shadow
//        let syncStepShadow = NSShadow()
//        syncStepShadow.shadowBlurRadius = 2
//        syncStepShadow.shadowOffset = CGSize(width: 3, height: 3)
//        syncStepShadow.shadowColor = Colors.gray
//
//        syncStepText.addAttribute(NSAttributedString.Key.shadow,
//                                  value: syncStepShadow,
//                                  range: NSRange(location: 0, length: syncStepText.length))
        
        // Set 'Sync' to have yellow outline and 'Step' to have black outline
        let syncAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: Colors.mustardYellow,
            NSAttributedString.Key.foregroundColor: Colors.black,
            NSAttributedString.Key.strokeWidth: -3.0,
            NSAttributedString.Key.font: UIFont(name: "FalconPunch", size: 48)!
        ]
        
        let stepAttributes: [NSAttributedString.Key: Any] = [
            NSAttributedString.Key.strokeColor: Colors.black,
            NSAttributedString.Key.foregroundColor: Colors.mustardYellow,
            NSAttributedString.Key.strokeWidth: -3.0,
            NSAttributedString.Key.font: UIFont(name: "FalconPunch", size: 48)!
        ]
        
        syncStepText.addAttributes(syncAttributes,
                                   range: NSRange(location: 0, length: 4))
        syncStepText.addAttributes(stepAttributes,
                                   range: NSRange(location: 4, length: 4))
        
        // Set up SyncStep label
        let syncStepLabel = UILabel()
        syncStepLabel.attributedText = syncStepText
        syncStepLabel.sizeToFit()
        
        view.addSubview(syncStepLabel)
        
        syncStepLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            syncStepLabel.widthAnchor.constraint(equalToConstant: syncStepLabel.frame.width + 10),
            syncStepLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 5),
            syncStepLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250)
        ])
        
        syncStepLabel.layer.shadowOffset = CGSize(width: 3, height: 3)
        syncStepLabel.layer.shadowOpacity = 0.25
        syncStepLabel.layer.shadowRadius = 2
        syncStepLabel.layer.shadowColor = Colors.black.cgColor
        
        
        // Set up Log In button
        let loginButton = UIButton()
        loginButton.setTitle("Log In", for: .normal)
        loginButton.setTitleColor(Colors.black, for: .normal)
        loginButton.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 24)
        loginButton.layer.cornerRadius = 15
        loginButton.backgroundColor = Colors.mustardYellow
        loginButton.layer.borderColor = Colors.black.cgColor
        loginButton.layer.borderWidth = 1
        loginButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        loginButton.layer.shadowOpacity = 0.25
        loginButton.layer.shadowRadius = 2
        loginButton.layer.shadowColor = Colors.black.cgColor
        loginButton.addTarget(self, action: #selector(loginPressed), for: .touchUpInside)
        
        view.addSubview(loginButton)
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            loginButton.widthAnchor.constraint(equalToConstant: 214),
            loginButton.heightAnchor.constraint(equalToConstant: 45),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.topAnchor.constraint(equalTo: syncStepLabel.bottomAnchor, constant: 100)
        ])
        
        // Set up Sign Up button
        let signupButton = UIButton()
        signupButton.setTitle("Sign Up", for: .normal)
        signupButton.setTitleColor(Colors.mustardYellow, for: .normal)
        signupButton.titleLabel?.font = UIFont(name: "Roboto-Bold", size: 24)
        signupButton.layer.cornerRadius = 15
        signupButton.backgroundColor = Colors.black
        signupButton.layer.borderColor = Colors.mustardYellow.cgColor
        signupButton.layer.borderWidth = 1
        signupButton.layer.shadowOffset = CGSize(width: 3, height: 3)
        signupButton.layer.shadowOpacity = 0.25
        signupButton.layer.shadowRadius = 2
        signupButton.layer.shadowColor = Colors.black.cgColor
        signupButton.addTarget(self, action: #selector(signupPressed), for: .touchUpInside)
        
        view.addSubview(signupButton)
        
        signupButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            signupButton.widthAnchor.constraint(equalToConstant: 214),
            signupButton.heightAnchor.constraint(equalToConstant: 45),
            signupButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            signupButton.topAnchor.constraint(equalTo: loginButton.bottomAnchor, constant: 50)
        ])
    }
    
    @objc func loginPressed() {
        print("Log In Pressed")
        guard let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Storyboard.loginVC) as? LoginViewController else {
            print("Could not instantiate Login View Controller")
            return
        }
        self.navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @objc func signupPressed() {
        print("Sign Up Pressed")
        guard let signupVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: Storyboard.signupVC) as? SignupViewController else {
            print("Could not instantiate Signup View Controller")
            return
        }
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
}

