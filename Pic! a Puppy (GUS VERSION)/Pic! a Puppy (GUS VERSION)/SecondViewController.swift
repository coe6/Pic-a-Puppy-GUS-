//
//  SecondViewController.swift
//  Pic! a Puppy (GUS VERSION)
//
//  Created by Sam on 5/18/18.
//  Copyright © 2018 github.com/coe6. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var gusImage: UIImageView!
    @IBOutlet weak var prevBttn: UIButton!
    @IBOutlet weak var nextBttn: UIButton!
    @IBOutlet weak var favBttn: UIButton!
    @IBOutlet weak var homeBttn: UIButton!
    @IBOutlet weak var beginBttn: UIButton!
    
    var gusImgArr = ["img1.png"]
    var indexArr = [Int(arc4random_uniform(65))]
    var index = -1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 2...65 {
            gusImgArr.append("img\(i).png")
        }
        
        for _ in 0...64 {
            var temp = Int(arc4random_uniform(65))
            
            for i in 0...indexArr.count-1 {
                while(temp == indexArr[i]) {
                    temp = Int(arc4random_uniform(65))
                }
            }
            
            indexArr.append(temp)
        }

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gusImage.isHidden = true
        beginBttn.isHidden = false
    }
    
    @IBAction func displayImg(_ sender: Any) {
        let button =  sender as! UIButton
        
        switch button.tag {
        case 1:
            generateImage()
            break
        case 2:
            prevImage()
            break
        case 3:
            break
        case 4:
            gusImage.isHidden = false
            beginBttn.isHidden = true
            generateImage()
            break
        default: break
        }
    
    }
    
    func prevImage() {
        if(index != 0) {
            index -= 1
            gusImage.image = UIImage(named: gusImgArr[indexArr[index]])
        }
    }
    
    func generateImage() {
        if(index < 65) {
            index += 1
            gusImage.image = UIImage(named: gusImgArr[indexArr[index]])
        } else {
            index = 0
            gusImage.image = UIImage(named: gusImgArr[indexArr[index]])
        }
    }
    
    func favImage() {
        
    }

}
