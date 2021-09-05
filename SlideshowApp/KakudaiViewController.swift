//
//  KakudaiViewController.swift
//  SlideshowApp
//
//  Created by 岸田展明 on 2021/09/01.
//

import UIKit

class KakudaiViewController: UIViewController {

    var kakudai_image:UIImage!
    
    @IBOutlet weak var kakudai_ImgBoard: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let Image_orange = UIImage(named: "image_orange.jpg")
        
        kakudai_ImgBoard.image = kakudai_image
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
