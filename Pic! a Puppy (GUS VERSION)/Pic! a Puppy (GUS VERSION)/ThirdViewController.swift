//
//  ThirdViewController.swift
//  Pic! a Puppy (GUS VERSION)
//
//  Created by Sam on 5/24/18.
//  Copyright © 2018 github.com/coe6. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController {
    
    @IBOutlet weak var gusImg: UIImageView!
    @IBOutlet weak var prevBttn: UIButton!
    @IBOutlet weak var nextBttn: UIButton!
    @IBOutlet weak var favBttn: UIButton!
    @IBOutlet weak var favText: UILabel!
    
    var ImgArr: [imgProp] = []
    var gusImgFav = [String]()
    var index = 0
    var indexArr = [Int]()

    override func viewDidLoad() {
        super.viewDidLoad()

        if(ImgArr.count > 0) {
            for i in 0...ImgArr.count-1 {
                if(ImgArr[i].fav) {
                    gusImgFav.append(ImgArr[i].img)
                    indexArr.append(ImgArr[i].index)
                }
            }
            
            if(gusImgFav.count > 0) {
                gusImg.image = UIImage(named: gusImgFav[0])
                changeFavBttn()
                favText.isHidden = true
                enableBttn()
            } else {
                favText.isHidden = false
                disableBttn()
            }
        } else {
            favText.isHidden = false
            disableBttn()
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(doubleTapped))
        tap.numberOfTapsRequired = 2
        view.addGestureRecognizer(tap)
    }
    
    @objc func doubleTapped() {
        favImg()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ViewController
        vc.ImgArr = ImgArr
    }
    
    func disableBttn() {
        favBttn.isEnabled = false
        nextBttn.isEnabled = false
        prevBttn.isEnabled = false
    }
    
    func enableBttn() {
        favBttn.isEnabled = true
        nextBttn.isEnabled = true
        prevBttn.isEnabled = true
    }
    
    func changeFavBttn() {
        if(ImgArr[indexArr[index]].fav) {
            favBttn.setImage(#imageLiteral(resourceName: "postFAV"), for: .normal)
        } else {
            favBttn.setImage(#imageLiteral(resourceName: "preFAV"), for: .normal)
        }
    }

    func generateImg() {
        if(index < gusImgFav.count-1) {
            index += 1
            
            UIView.transition(with: gusImg, duration: 0.2, options: .transitionCurlUp, animations: {
                self.gusImg.image = UIImage(named: self.gusImgFav[self.index])
            }, completion: nil)
            
        } else {
            index = 0
            if(gusImgFav.count > 0) {
                
                UIView.transition(with: gusImg, duration: 0.2, options: .transitionCurlUp, animations: {
                    self.gusImg.image = UIImage(named: self.gusImgFav[self.index])
                }, completion: nil)
                
            } else {
                favText.isHidden = false
                gusImg.isHidden = true
                disableBttn()
                return
            }
        }
        changeFavBttn()
    }

    func prevImg() {
        if(index != 0) {
            index -= 1
        } else {
            index = gusImgFav.count-1
        }
        
        UIView.transition(with: gusImg, duration: 0.2, options: .transitionCurlDown, animations: {
            self.gusImg.image = UIImage(named: self.gusImgFav[self.index])
        }, completion: nil)
        
        changeFavBttn()
    }

    func favImg() {
        if(ImgArr[indexArr[index]].fav) {
            let alert = UIAlertController(title: "Are you sure you would like to unfavorite?", message: "You will have to wait for the image to reappear in order to favorite it again..", preferredStyle: UIAlertControllerStyle.actionSheet)

            alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.default, handler: { action in
                self.ImgArr[self.indexArr[self.index]].fav = !self.ImgArr[self.indexArr[self.index]].fav
                self.changeFavBttn()
                self.gusImgFav.remove(at: self.index)
                self.indexArr.remove(at: self.index)
                self.generateImg()
            }))
            alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.cancel, handler: nil))
            
            self.present(alert, animated: true)
        }
        
        if(gusImgFav.count == 0) {
            disableBttn()
        } else {
            enableBttn()
        }
    }
    
    
    @IBAction func swipeGest(_ sender: Any) {
        let swipeGesture = sender as! UISwipeGestureRecognizer
        
        switch swipeGesture.direction {
        case UISwipeGestureRecognizerDirection.right:
            prevImg()
            break
        case UISwipeGestureRecognizerDirection.left:
            generateImg()
            break
        default: break
        }
    }
    
    @IBAction func bttnPress(_ sender: Any) {
        let button = sender as! UIButton

        switch button.tag {
        case 1:
            generateImg()
            break
        case 2:
            prevImg()
            break
        case 3:
            favImg()
            break
        default:
            break
        }
    }
}
