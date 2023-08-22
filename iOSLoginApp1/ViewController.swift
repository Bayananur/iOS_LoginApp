//
//  ViewController.swift
//  iOSLoginApp1
//
//  Created by Bauyrzhan Seidazymov on 17.08.2023.
//

import UIKit

extension UIImage {
    func rotate(radians: CGFloat) -> UIImage {
        let rotatedSize = CGRect(origin: .zero, size: size)
            .applying(CGAffineTransform(rotationAngle: CGFloat(radians)))
            .integral.size
        UIGraphicsBeginImageContext(rotatedSize)
        if let context = UIGraphicsGetCurrentContext() {
            let origin = CGPoint(x: rotatedSize.width / 2.0,
                                 y: rotatedSize.height / 2.0)
            context.translateBy(x: origin.x, y: origin.y)
            context.rotate(by: radians)
            draw(in: CGRect(x: -origin.x, y: -origin.y,
                            width: size.width, height: size.height))
            let rotatedImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            
            return rotatedImage ?? self
        }
        
        return self
    }
}


class ViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!    
    @IBOutlet weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureViews()
    }
    func configureViews() {
        
        emailTextField.layer.cornerRadius = 28.0
        emailTextField.clipsToBounds = true
        passwordTextField.layer.cornerRadius = 28.0
        passwordTextField.clipsToBounds = true
        signInButton.layer.cornerRadius = 28.0
        signInButton.clipsToBounds = true
        signInButton.titleLabel?.font = UIFont.systemFont(ofSize: 23)
        }
    
    @IBAction func buttonTouched(_ sender: Any) {
        print(emailTextField.text ?? "nill")
        print(passwordTextField.text ?? "nill")
    }
}
