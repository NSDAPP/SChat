//
//  ViewController.swift
//  SChat
//
//  Created by Nikolai Dirks on 20/09/2017.
//  Copyright © 2017 NSD. All rights reserved.
//

//import UIKit
//import FacebookCore
//import FacebookLogin
//import Firebase
//import FirebaseAuth
//
//
//class SignInVC: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    @IBAction func facebookBtnTappen(_ sender: Any) {
//        
//        let facebookLogin = LoginManager()
//        
//        facebookLogin.logIn([ ReadPermissions.publicProfile ], viewController: self) { loginResult in
//            switch loginResult {
//                print("Unable to authenticate - \(error)")
//            } else if result?.isCancelled == true {
//            print("User cancelled facebook auth")
//            } else {
//                print("Succesfully auth with facebook")
//                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
//                //var current : AcessToken
//                self.firebaseAuth(credential)
//            }
//        
//        }
//        
//    }
//
//}

import UIKit
import FacebookLogin
import FacebookCore
import Firebase
class SignInVC: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func facebookLoginBtnTappen(_ sender: Any) {
        let loginManager = LoginManager()
        loginManager.logIn([ .publicProfile ], viewController: self) { loginResult in
            switch loginResult {
            case .failed(let error):
                print(error)
            case .cancelled:
                print("User cancelled login.")
            case .success(let grantedPermissions, let declinedPermissions, let accessToken):
                print("Logged in!")
                let credential = FacebookAuthProvider.credential(withAccessToken: accessToken.authenticationToken)
                self.firebaseAuth(credential)
                
            }
        }
    }
    
    func firebaseAuth(_ credential: AuthCredential) {
        Auth.auth().signIn(with: credential) { (user, error) in
            if (error != nil) {
                print("Unable to sign in with firebase")
            } else {
                print("Sucessful sign in with firebase")
            }
        }
    }
}
