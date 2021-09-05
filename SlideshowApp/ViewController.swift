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
    
    // 画像を配列に入れる
    var value_image: [UIImage] = [UIImage(named: "image_red.jpg")!,
                                  UIImage(named: "image_blue.jpg")!,
                                  UIImage(named: "image_orange.jpg")!]
    
    // timer
    var timer: Timer!
    var timer_sec: Int = 0
    
    // flag
    var flag: Int = 0
    
    @objc func updateTimer(_ timer: Timer){
        
        if timer_sec >= 3 {
            timer_sec = 0
        }
        
        // 画像を表示する
        ImgBoard.image = value_image[timer_sec]
        
        print("timer_sec = \(timer_sec)")
        
        self.timer_sec += 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // tapを検知できるようにする設定
        ImgBoard.isUserInteractionEnabled = true
        
        // 初期画像の表示
        //ImgBoard.image = Image_red
        ImgBoard.image = value_image[1]
        
        
        
    }

    @IBAction func tapSingle2(_ sender: Any) {
        
        ImgBoard.image = Image_orange
        
        //let kakudaiViewController:KakudaiViewController = segue.destination as! KakudaiViewController
        
        //KakudaiViewController.kakudai_image = Image_blue
        
        self.performSegue(withIdentifier: "toSecond", sender: self)
        
        print("tapされました")
    }
    
    
    @IBAction func Susumu(_ sender: Any) {
        
        timer_sec += 1
        
        if timer_sec >= 3 {
            timer_sec = 0
        }
        
        // 画像を表示する
        ImgBoard.image = value_image[timer_sec]
        
        print("進むボタンがpushされました")
    }
    

    @IBAction func Modoru(_ sender: Any) {
        
        
        
        if timer_sec == 0 {
            timer_sec = 2
        }
        else {
            timer_sec -= 1
        }
        
        // 画像を表示する
        ImgBoard.image = value_image[timer_sec]
        
        print("戻るボタンがpushされました")
    }
    
    
    @IBAction func Saisei_Teishi(_ sender: Any) {
        
        if self.timer == nil {      // timerが実行されていない場合
            // タイマーの実行（２秒ごと）
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
        }
        else {                    // timerが実行されている場合
            // タイマーを停止する
            self.timer.invalidate()
            self.timer = nil
        }
    }
    
    @IBAction func unwind2(_ segue: UIStoryboardSegue){
        
        // 戻って来たときに呼ばれる
        
    }
    
}

