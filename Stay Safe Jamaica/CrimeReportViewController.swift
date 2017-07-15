//
//  CrimeReportViewController.swift
//  Stay Safe Jamaica
//
//  Created by Jamel Reid  on 7/15/17.
//  Copyright © 2017 Stay Safe Jamaica. All rights reserved.
//

import UIKit

enum Button
{
    case shootingCrime, theft, accident, sexualAssault, otherCrime, crimeDescription
}

class CrimeReportViewController: UIViewController
{
    @IBOutlet weak var shootingCrime: UIButton!
    @IBOutlet weak var theft: UIButton!
    @IBOutlet weak var accident: UIButton!
    @IBOutlet weak var sexualAssault: UIButton!
    @IBOutlet weak var otherCrime: UIButton!
    @IBOutlet weak var crimeDescription: UITextView!
    
    var buttonSelected: UIButton?
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reportShooting(_ sender: UIButton)
    {
        // TODO: Check if any buttons are already selected
        if let buttonSelected = buttonSelected
        {
            revertSelectedButton(button: buttonSelected)
        }
        
    }
    
    func revertSelectedButton(button: UIButton)
    {
        button.isSelected = false
    }
    
    @IBAction func reportTheft(_ sender: UIButton)
    {
    }
    
    @IBAction func reportAccident(_ sender: UIButton)
    {
    }
    
    @IBAction func reportSexualAssault(_ sender: UIButton)
    {
    }
    
    @IBAction func reportOtherCrime(_ sender: UIButton)
    {
    }
    
    @IBAction func submitReport(_ sender: UIButton)
    {
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
