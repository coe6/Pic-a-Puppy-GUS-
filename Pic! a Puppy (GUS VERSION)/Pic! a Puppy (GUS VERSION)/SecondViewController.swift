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
    var favArr = [String]()
    var indexArr = [Int(arc4random_uniform(65))]
    var index = 0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...65 {
            gusImgArr.append("img\(i).png")
            ImgArr.append(imgProp(img: "img\(i).png", index: i, fav: false))
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.ImgArr = ImgArr
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        gusImage.isHidden = true
        beginBttn.isHidden = false
    }
    
    @IBAction func displayImg(_ sender: Any) {
        let button =  sender as! UIButton
        
        print(ImgArr)
        
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
        
        if(ImgArr[indexArr[index]].fav) {
            favArr.append(gusImgArr[indexArr[index]])
        } else {
            let spot = favArr.index(of: gusImgArr[indexArr[index]])
            favArr.remove(at: spot!)
        }
        
        print(favArr)
    }

}
