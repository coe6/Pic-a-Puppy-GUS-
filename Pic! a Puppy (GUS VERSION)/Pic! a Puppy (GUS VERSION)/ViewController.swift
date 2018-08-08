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

//code for storing fav images

//    var ImgArr: [imgProp] = []
//    var gusImgFav = UserDefaults.standard.stringArray(forKey: "fav")
//    var gusImgDefault = UserDefaults.standard
//    var indexArr = UserDefaults.standard.array(forKey: "index")
//    var indexDefault = UserDefaults.standard
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        checkFav()
//
//        gusImgDefault.set(gusImgFav, forKey: "fav")
//        indexDefault.set(indexArr, forKey: "index")
//        // Do any additional setup after loading the view, typically from a nib.
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//    override func viewWillAppear(_ animated: Bool) {
//        if(gusImgDefault.value(forKey: "fav") != nil) {
//            gusImgFav = gusImgDefault.stringArray(forKey: "fav")
//        }
//
//        if(indexDefault.value(forKey: "index") != nil) {
//            indexArr = indexDefault.array(forKey: "index")
//        }
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let button = sender as! UIButton
//
//        checkFav()
//
//        if(button.tag == 1) {
//            let vc = segue.destination as! SecondViewController
//            vc.ImgArr = ImgArr
//
//        } else if(button.tag == 2) {
//            let vc = segue.destination as! ThirdViewController
//            vc.ImgArr = ImgArr
//
//            vc.gusImgFav = gusImgFav!
//            let temp = gusImgFav
//            gusImgDefault.set(temp, forKey: "fav")
//            gusImgDefault.synchronize()
//
//            if(gusImgDefault.value(forKey: "fav") != nil) {
//                gusImgFav = gusImgDefault.stringArray(forKey: "fav")
//            }
//
//            vc.indexArr = indexArr as! [Int]
//            let temp2 = indexArr
//            indexDefault.set(temp2, forKey: "index")
//            indexDefault.synchronize()
//
//            if(indexDefault.value(forKey: "index") != nil) {
//                indexArr = indexDefault.array(forKey: "index")
//            }
//
//        } else if(button.tag == 3) {
//            _ = segue.destination as! FourthViewController
//        }
//    }
//
//    func checkFav() {
//        let vc = ThirdViewController()
//        if(vc.gusImgFav.count != 0) {
//            gusImgFav = vc.gusImgFav
//        } else {
//            vc.gusImgFav = gusImgFav!
//        }
//
//        if(vc.indexArr.count != 0) {
//            indexArr = vc.indexArr
//        } else {
//            vc.indexArr = indexArr as! [Int]
//        }
//
//
//        let temp = gusImgFav
//        let temp2 = indexArr
//
//        gusImgDefault.set(temp, forKey: "fav")
//        gusImgDefault.synchronize()
//
//        indexDefault.set(temp2, forKey: "index")
//        indexDefault.synchronize()
//    }
//
//}
