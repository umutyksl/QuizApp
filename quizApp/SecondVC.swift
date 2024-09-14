//
//  SecondVC.swift
//  quizApp
//
//  Created by Umut Yüksel on 2.09.2024.
//

import UIKit
import AVFoundation

class SecondVC: UIViewController {
    
    
    @IBOutlet weak var buttonA: UIButton!
    @IBOutlet weak var buttonB: UIButton!
    @IBOutlet weak var buttonC: UIButton!
    @IBOutlet weak var buttonD: UIButton!
    
    @IBOutlet weak var viewBG: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var soruSayi: UILabel!
    
    var skor = 0
    var hangiSorudasın = 0
    
    var KavramlarListe = [Kavramlar]()
    
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        
        let s1 = Kavramlar(soru: "bear1", a: "8", b: "2", c: "10", d: "3", correctAnswer: "10")
        let s2 = Kavramlar(soru: "cat1", a: "6", b: "1", c: "4", d: "7", correctAnswer: "6")
        let s3 = Kavramlar(soru: "cow1", a: "2", b: "4", c: "1", d: "9", correctAnswer: "1")
        let s4 = Kavramlar(soru: "dog1", a: "6", b: "8", c: "10", d: "3", correctAnswer: "8")
        let s5 = Kavramlar(soru: "elephant1", a: "8", b: "1", c: "7", d: "9", correctAnswer: "9")
        let s6 = Kavramlar(soru: "horse1", a: "9", b: "4", c: "10", d: "1", correctAnswer: "4")
        let s7 = Kavramlar(soru: "monkey1", a: "5", b: "7", c: "3", d: "9", correctAnswer: "3")
        let s8 = Kavramlar(soru: "pig1", a: "8", b: "1", c: "7", d: "2", correctAnswer: "7")
        let s9 = Kavramlar(soru: "rabbit1", a: "2", b: "4", c: "1", d: "9", correctAnswer: "2")
        let s10 = Kavramlar(soru: "sheep1", a: "10", b: "3", c: "4", d: "5", correctAnswer: "5")
        
        KavramlarListe.append(s1)
        KavramlarListe.append(s2)
        KavramlarListe.append(s3)
        KavramlarListe.append(s4)
        KavramlarListe.append(s5)
        KavramlarListe.append(s6)
        KavramlarListe.append(s7)
        KavramlarListe.append(s8)
        KavramlarListe.append(s9)
        KavramlarListe.append(s10)
        
        
        setupUI()
        showQuestion(index: hangiSorudasın)
        
    }
    
    func setupUI(){
        let buttons = [buttonA, buttonB, buttonC, buttonD]
        
        for button in buttons {
            button?.layer.cornerRadius = 12
            button?.layer.masksToBounds = true
            button?.layer.borderWidth = 2.5
            button?.layer.borderColor = UIColor.black.cgColor
            button?.setTitleColor(UIColor.black, for: .normal)
            button?.addTarget(self, action: #selector(buttonBasildi(_:)), for: .touchUpInside)
        }
        
        viewBG.layer.cornerRadius = 12
        viewBG.layer.borderColor = UIColor.black.cgColor
        viewBG.layer.borderWidth = 2.5
    }
    
    func showQuestion(index: Int){
        let sorudasin = KavramlarListe[index]
        imageView.image = UIImage(named: sorudasin.soru!)
        buttonA.setTitle(sorudasin.a, for: .normal)
        buttonB.setTitle(sorudasin.b, for: .normal)
        buttonC.setTitle(sorudasin.c, for: .normal)
        buttonD.setTitle(sorudasin.d, for: .normal)
        soruSayi.text = "\(index + 1)/ \(KavramlarListe.count)"
        
    }
    
    @objc func buttonBasildi(_ sender: UIButton){
        let sorudasin = KavramlarListe[hangiSorudasın]
        
        if sender.currentTitle == sorudasin.correctAnswer {
            sender.backgroundColor = UIColor.green
            skor += 10
            score.text = String(skor)
            
            let url = Bundle.main.url(forResource: "correct", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }
        else{
            sender.backgroundColor = UIColor.red
            
            let url = Bundle.main.url(forResource: "wrong", withExtension: "mp3")
            player = try! AVAudioPlayer(contentsOf: url!)
            player!.play()
        }

        
        hangiSorudasın += 1
        
        if hangiSorudasın < KavramlarListe.count {
            showQuestion(index: hangiSorudasın)
        }
        else{
            if skor == 100 {
                let uyari2 = UIAlertController(title: "Hepsi Doğru \(skor) Puan", message: "10 Doğru 0 Yanlış", preferredStyle: UIAlertController.Style.alert)
                let OkBtn2 = UIAlertAction(title: "Çıkış", style: UIAlertAction.Style.default){ _ in
                exit(0)
                }
                let TryBtn2 = UIAlertAction(title: "Tekrar Oyna", style: UIAlertAction.Style.default) { _ in
                    self.oyunuTekarBaslat()
                }
                uyari2.addAction(TryBtn2)
                uyari2.addAction(OkBtn2)
                self.present(uyari2, animated: true, completion: nil)
            }
            else{
                let uyari = UIAlertController(title: "Skorun: \(skor)", message: "\(skor / 10) Doğru \(10 - (skor / 10)) Yanlış", preferredStyle: UIAlertController.Style.alert)
                let okBtn = UIAlertAction(title: "Çıkış", style: UIAlertAction.Style.default) { _ in
                exit(0)
                }
                let TryBtn = UIAlertAction(title: "Tekrar Oyna", style: UIAlertAction.Style.default) { _ in
                    self.oyunuTekarBaslat()
                }
                uyari.addAction(TryBtn)
                uyari.addAction(okBtn)
                self.present(uyari, animated: true, completion: nil)
            }
            
        }
    }
    func oyunuTekarBaslat () {
        self.skor = 0
        self.hangiSorudasın = 0
        self.score.text = "0"
        self.showQuestion(index: self.hangiSorudasın)
    }
}
