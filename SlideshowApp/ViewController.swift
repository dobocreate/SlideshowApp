//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岸田展明 on 2021/09/01.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ImgBoard: UIImageView!
    
    // 画像の読み込み
    let Image_red = UIImage(named: "image_red.jpg")
    let Image_blue = UIImage(named: "image_blue.jpg")
    let Image_orange = UIImage(named: "image_orange.jpg")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let singleTap = UITapGestureRecognizer(target:self, action: #selector(ViewController.tapSingle(sender:)))
        
        //view.addGestureRecognizer(singleTap)
        ImgBoard.addGestureRecognizer(singleTap)
        
        // 初期画像の表示
        ImgBoard.image = Image_red
    }

    @objc func tapSingle(sender: UITapGestureRecognizer){
        
        print("single")
    }
    
    
    @IBAction func Susumu(_ sender: Any) {
        
        ImgBoard.image = Image_blue
    }
    

    @IBAction func Modoru(_ sender: Any) {
        
        
    }
    
    
    @IBAction func Saisei_Teishi(_ sender: Any) {
        
        
    }
    
}

