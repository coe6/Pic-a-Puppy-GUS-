//
//  ViewController.swift
//  Pic! a Puppy (GUS VERSION)
//
//  Created by Sam on 5/18/18.
//  Copyright © 2018 github.com/coe6. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var startBttn: UIButton!
    @IBOutlet weak var favBttn: UIButton!
    @IBOutlet weak var infoBttn: UIButton!
    
    var ImgArr: [imgProp] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let button = sender as! UIButton
        
        if(button.tag == 1) {
            let vc = segue.destination as! SecondViewController
            vc.ImgArr = ImgArr
        } else if(button.tag == 2) {
            let vc = segue.destination as! ThirdViewController
            vc.ImgArr = ImgArr
        } else if(button.tag == 3) {
            _ = segue.destination as! FourthViewController
        }
    }

}

