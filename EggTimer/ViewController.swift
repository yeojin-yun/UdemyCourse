//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {
    
    
    @IBOutlet weak var mainLbl: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    var player: AVAudioPlayer?
    
    let eggTimes = ["Soft": 5, "Medium": 8, "Hard": 10]
    var totalTime = 0
    var secondsPassed = 0
    var timer = Timer()
    

    @IBAction func btnTapped(_ sender: UIButton) {
        
        timer.invalidate()
        /*이렇게 안 하면 우리가 버튼을 누를 때마다 updateTime() 메서드가 실행돼서
        타이머가 엄~청 빨라짐*/
        
        let hardness = sender.currentTitle!
        totalTime = eggTimes[hardness]!
        
        //soft, medium, hard 버튼 누를 때마다 새롭게 셋팅 필요
        progressView.progress = 0.0
        secondsPassed = 0
        mainLbl.text = hardness
        
        
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        print(timer)
    }
    
        @objc func updateTime() {
            if secondsPassed < totalTime {
                secondsPassed += 1
                //여기 있어야 마지막 secondsPassed가 + 1되어 percentageProgress 계산에 들어감
                let percentageProgress = Float(secondsPassed) / Float(totalTime)
                //Float(secondsPassed / totalTime)으로 넣으면 몫이 Float형태로 나옴
                //Float(3 / 5) -> 6.0으로 나오게 됨
                
                progressView.setProgress(Float(percentageProgress), animated: true)
                print("total: \(secondsPassed)")
                
            } else {
                timer.invalidate()
                mainLbl.text = "Done"
                playSound()
            }
        }
    
    //시간 다되면 알람 사운드 울리기
    func playSound() {
        guard let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3") else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            
            guard let player = player else { return }
            
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}

