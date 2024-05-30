//
//  ViewController.swift
//  DarvaFg
//
//  Created by Pawan on 17/01/24.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FBSDKShareKit
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let loginButton = FBLoginButton()
        loginButton.center = view.center
        view.addSubview(loginButton)
        
        let fbLoginManager : LoginManager = LoginManager()
        if((AccessToken.current) != nil) {
            fbLoginManager.logOut()
        }
        fbLoginManager.logIn(permissions:  ["email"], from: nil) { result, error in
            if (error == nil){
               
                let fbloginresult : LoginManagerLoginResult = result!
                // if user cancel the login
                if (result?.isCancelled)!{
                   print(result)
                    return
                } else {
                    print("errrrrrrr")
                }
            }
            else {
               print("errrrrrrr")
            }
        }
        GraphRequest(graphPath: "me", parameters: ["fields": "id, name, first_name, last_name, picture.type(large), email"]).start(completion: { (connection, result, error) -> Void in
            print("result")
            
        })
        

    }

}

