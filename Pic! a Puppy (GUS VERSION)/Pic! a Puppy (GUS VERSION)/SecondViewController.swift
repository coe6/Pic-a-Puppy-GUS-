//
//  SecondViewController.swift
//  Pic! a Puppy (GUS VERSION)
//
//  Created by Sam on 5/18/18.
//  Copyright © 2018 github.com/coe6. All rights reserved.
//

import UIKit

struct imgProp {
    var img: String
    var index: Int
    var fav: Bool
}

class SecondViewController: UIViewController {

    @IBOutlet weak var gusImage: UIImageView!
    @IBOutlet weak var prevBttn: UIButton!
    @IBOutlet weak var nextBttn: UIButton!
    @IBOutlet weak var favBttn: UIButton!
    @IBOutlet weak var homeBttn: UIButton!
    @IBOutlet weak var beginBttn: UIButton!
    
    var ImgArr: [imgProp] = []
    
    var gusImgArr = [String]()
    var indexArr = [Int]()
    var index = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 0...65 {
            gusImgArr.append("img\(i).png")
            ImgArr.append(imgProp(img: "img\(i).png", index: i, fav: false))
        }
        var nums = Array(0...65)
        for _ in 0...65 {
            let index = Int(arc4random_uniform(UInt32(nums.count)))
            indexArr.append(nums[index])
            nums.remove(at: index)
        }
        gusImage.image = UIImage(named: gusImgArr[indexArr[index]])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.ImgArr = ImgArr
        
    }
    
    @IBAction func swipe(_ sender: Any) {
        let swipeGesture = sender as! UISwipeGestureRecognizer
        
        switch swipeGesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            prevImage()
            break
        case UISwipeGestureRecognizerDirection.left:
            generateImage()
            break
        default: break
        }
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
            favImage()
            break
        default: break
        }
    
    }
    
    func prevImage() {
        if(index != 0) {
            index -= 1
            gusImage.image = UIImage(named: gusImgArr[indexArr[index]])
        }
        changeFavBttn()
    }
    
    func generateImage() {
        if(index < 65) {
            index += 1
            gusImage.image = UIImage(named: gusImgArr[indexArr[index]])
        } else {
            index = 0
            gusImage.image = UIImage(named: gusImgArr[indexArr[index]])
        }
       changeFavBttn()
    }
    
    func changeFavBttn() {
        if(ImgArr[indexArr[index]].fav) {
            favBttn.setImage(#imageLiteral(resourceName: "postFAV"), for: .normal)
        } else {
            favBttn.setImage(#imageLiteral(resourceName: "preFAV"), for: .normal)
        }
    }
    
    func favImage() {
        ImgArr[indexArr[index]].fav = !ImgArr[indexArr[index]].fav
        changeFavBttn()
    }

}
