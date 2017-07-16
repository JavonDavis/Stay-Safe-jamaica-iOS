//
//  LoginViewController.swift
//  Stay Safe Jamaica
//
//  Created by Jase-Omeileo West on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController
{
    @IBOutlet weak var userEmailAddress: UITextField!
    @IBOutlet weak var userPassword: UITextField!
    
    let registerSegueIdentifier = "showRegisterViewController"
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        navigationController?.setNavigationBarHidden(false, animated: true)
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: UIButton)
    {
        if let emailAddress = userEmailAddress.text, let password = userPassword.text
        {
            Auth.auth().signIn(withEmail: emailAddress, password: password) {(user, error) in
                if error != nil
                {
                    self.showAlert(title: "Error", message: "Sorry, but you could not be logged in. Try again.")
                }
                else
                {
                    _ = self.navigationController?.popViewController(animated: true)
                }
            }
        }
    }

    @IBAction func register(_ sender: UIButton)
    {
        performSegue(withIdentifier: registerSegueIdentifier, sender: self)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
