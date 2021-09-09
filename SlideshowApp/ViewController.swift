//
//  ViewController.swift
//  SlideshowApp
//
//  Created by 岸田展明 on 2021/09/01.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var ImgBoard: UIImageView!
    
    @IBOutlet weak var Susumu_Button: UIButton!
    @IBOutlet weak var Modoru_Button: UIButton!
    @IBOutlet weak var Saisei_Teishi_Label: UIButton!
    
    // 画像の読み込み
    let Image_red = UIImage(named: "image_red.jpg")
    let Image_blue = UIImage(named: "image_blue.jpg")
    let Image_orange = UIImage(named: "image_orange.jpg")
    
    // 配列に画像を格納する
    var value_image: [UIImage] = [UIImage(named: "image_red.jpg")!,
                                  UIImage(named: "image_blue.jpg")!,
                                  UIImage(named: "image_orange.jpg")!]
    
    // timer
    var timer: Timer!
    var img_count: Int = 0
    
    //var saisei: Int = 0
    
    @objc func updateTimer(_ timer: Timer){
        
        img_count += 1
        
        if img_count >= 3 {
            img_count = 0
        }
        
        // 画像を表示する
        ImgBoard.image = value_image[img_count]
        
        print("img_count = \(img_count)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 起動時に実行される
        
        // tapを検知できるようにする設定
        ImgBoard.isUserInteractionEnabled = true
        
        // 初期画像の表示
        //ImgBoard.image = Image_red
        ImgBoard.image = value_image[0]
        
        // ボタンのタイトルを設定
        Saisei_Teishi_Label.setTitle("再生", for:.normal)
    }

    @IBAction func tapSingle2(_ sender: Any) {
        
        //ImgBoard.image = Image_orange
        
        /*
        // 遷移する前に画像を代入する
        let kakudaiViewController:KakudaiViewController = segue.destination as! KakudaiViewController
        
        KakudaiViewController.kakudai_image = Image_blue
        */
        
        // segue id:"toScond"に遷移する
        self.performSegue(withIdentifier: "toSecond", sender: self)
        
        print("tapされました")
    }
    
    // 画面の遷移前に呼び出される関数
    override func prepare(for segue: UIStoryboardSegue, sender:Any?){
        
        if segue.identifier == "toSecond" {
            
            let kakudaiView = segue.destination as! KakudaiViewController
            
            kakudaiView.kakudai_image = value_image[img_count]
        }
    }
    
    @IBAction func Susumu(_ sender: Any) {
        
        img_count += 1
        
        if img_count >= 3 {
            img_count = 0
        }
        
        // 画像を表示する
        ImgBoard.image = value_image[img_count]
        
        print("進むボタンがpushされました。img_count = \(img_count)")
    }
    

    @IBAction func Modoru(_ sender: Any) {
        
        if img_count == 0 {
            img_count = 2
        }
        else {
            img_count -= 1
        }
        
        // 画像を表示する
        ImgBoard.image = value_image[img_count]
        
        print("戻るボタンがpushされました。img_count = \(img_count)")
    }
    
    
    @IBAction func Saisei_Teishi(_ sender: Any) {
        
        if self.timer == nil {      // timerが実行されていない場合
            // タイマーの実行（２秒ごと）
            timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(updateTimer(_:)), userInfo: nil, repeats: true)
            
            // ボタンを無効化する
            Susumu_Button.isEnabled = false         // 無効化
            
            Saisei_Teishi_Label.setTitle("停止", for:.normal)
        }
        else {                    // timerが実行されている場合
            // タイマーを停止する
            self.timer.invalidate()
            self.timer = nil
            
            Saisei_Teishi_Label.setTitle("再生", for:.normal)
        }
    }
    
    @IBAction func unwind2(_ segue: UIStoryboardSegue){
        
        // 戻って来たときに呼ばれる
        print("戻った")
        
    }
    
}

