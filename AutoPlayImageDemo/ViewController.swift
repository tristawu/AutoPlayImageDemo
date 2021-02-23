//
//  ViewController.swift
//  AutoPlayImageDemo
//
//  Created by Trista on 2021/2/23.
//

import UIKit

class ViewController: UIViewController {

    //建立一個myImageView屬性
    var myImageView: UIImageView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //取得螢幕的尺寸
        let fullScreenSize = UIScreen.main.bounds.size
        
        
        //設置輪播圖片的資訊
        myImageView = UIImageView(
          frame: CGRect(x: 0, y: 0, width: 150, height: 150))

        //建立一個陣列 用來放置要輪播的圖片
        let imgArr = [
          UIImage(named:"01.jpg")!,
          UIImage(named:"02.jpg")!,
          UIImage(named:"03.jpg")!]

        //設置要輪播的圖片陣列
        //為一個型別為[UIImage]的陣列，其內使用UIImage(named:)生成的圖片是可選的( optional )，必須將其解析(unwrap 加上驚嘆號!)，必須確定這些圖片檔案都存在，不然會導致程式錯誤並中止
        myImageView.animationImages = imgArr

        //輪播一次的總秒數
        //一張圖片若要顯示 2 秒，乘上圖片張數 3 張，就是要設置的總秒數
        myImageView.animationDuration = 6

        //要輪播幾次 (設置 0 則為無限次)
        myImageView.animationRepeatCount = 0

        //開始輪播
        myImageView.startAnimating()

        //設置位置及放入畫面中
        myImageView.center = CGPoint(
          x: fullScreenSize.width * 0.5,
          y: fullScreenSize.height * 0.4)
        self.view.addSubview(myImageView)
        
        
        //設置使用圖片的按鈕
        //建立一個播放按鈕
        //建立自定義的按鈕後,使用 UIButton 的方法setImage()，設置一個 UIImage 給它即可
        let playButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        //設置播放按鈕的圖片
        //圖片如果為 png 檔案類型，使用UImage(named:)生成元件時，可以不用寫副檔名.png
        //將檔案名稱設定好，程式就會自己找到檔案，如果沒有 @2x 及 @3x 不同解析度的圖片檔案，就會一律使用同樣尺寸的圖片檔案
        playButton.setImage(
            UIImage(named: "play"), for: .normal)

        //設置按下播放按鈕的動作的方法
        //第一個傳入參數是當事件發生時，要呼叫哪一個物件。
        //第二個傳入參數是呼叫的物件要執行的方法，以#selector()來指定，ViewController.play指的就是ViewController類別的play方法。
        //第三個傳入參數是觸發的事件。.touchUpInside是按下觸發
        playButton.addTarget(
            self,
            action: #selector(ViewController.play),
            for: .touchUpInside)

        //設置位置及放入畫面中
        playButton.center = CGPoint(
          x: fullScreenSize.width * 0.3,
          y: fullScreenSize.height * 0.6)
        self.view.addSubview(playButton)

        
        //建立一個停止按鈕
        //建立自定義的按鈕後,使用 UIButton 的方法setImage()，設置一個 UIImage 給它即可
        let stopButton = UIButton(frame: CGRect(x: 0, y: 0, width: 64, height: 64))
        //設置停止按鈕的圖片
        //圖片如果為 png 檔案類型，使用UImage(named:)生成元件時，可以不用寫副檔名.png
        //將檔案名稱設定好，程式就會自己找到檔案，程式就會自己找到檔案，如果沒有 @2x 及 @3x 不同解析度的圖片檔案，就會一律使用同樣尺寸的圖片檔案
        stopButton.setImage(UIImage(named: "stop"), for: .normal)

        //設置按下停止按鈕的動作的方法
        //第一個傳入參數是當事件發生時，要呼叫哪一個物件。
        //第二個傳入參數是呼叫的物件要執行的方法，以#selector()來指定，ViewController.stop指的就是ViewController類別的stop方法。
        //第三個傳入參數是觸發的事件。.touchUpInside是按下觸發
        stopButton.addTarget(
            self,
            action: #selector(ViewController.stop),
            for: .touchUpInside)

        //設置位置及放入畫面中
        stopButton.center = CGPoint(
          x: fullScreenSize.width * 0.6,
          y: fullScreenSize.height * 0.6)
        self.view.addSubview(stopButton)
    }
    
    
    //按下按鈕後執行動作的方法
    @objc func play() {
        print("play images auto play")
        //開始圖片輪播
        myImageView.startAnimating()
    }

    //按下按鈕後執行動作的方法
    @objc func stop() {
        print("stop images auto play")
        //停止圖片輪播
        myImageView.stopAnimating()
    }


}

