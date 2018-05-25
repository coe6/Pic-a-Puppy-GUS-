//
//  ThirdViewController.swift
//  Pic! a Puppy (GUS VERSION)
//
//  Created by Sam on 5/24/18.
//  Copyright © 2018 github.com/coe6. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    var ImgArr: [imgProp] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.ImgArr = ImgArr
    }

}
