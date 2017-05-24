//
//  sec2.swift
//  multV
//
//  Created by s20151104683 on 17/5/22.
//  Copyright © 2017年 s20151104683. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var vs: UITextField!
    @IBOutlet weak var Aleft: UIImageView!
    @IBOutlet weak var Aright: UIImageView!
    @IBOutlet weak var Bleft: UIImageView!
    @IBOutlet weak var Bright: UIImageView!
    @IBOutlet weak var A: UITextField!
    @IBOutlet weak var B: UITextField!
    @IBOutlet weak var game: UITextField!
    @IBOutlet weak var x: UITextField!
    @IBOutlet weak var y: UITextField!
    
    var xa:Int = 0
    var xb:Int = 0
    var xaa:Int = 0
    var xbb:Int = 0
    var dlg=0
    var flagA=0
    var flagB=0
    var del=0
    var aa = 0
    var bb = 0
    
    @IBAction func markA(_ sender: Any) {
        if dlg==1{
            del=1
            if game.text != "Game Over"{
                x.textAlignment = .center
                xa=xa+1
                if xa>=21{
                    let xaa=xa-2
                    if xaa >= xb{
                        x.text="胜利"
                        y.text="失败"
                        aa = aa + 1
                        
                        xa = 0
                        xb = 0
                       
                        if aa == 2{
                            game.text="Game Over"
                            xa = 0
                            x.text = ""
                            xb = 0
                            y.text = ""
                            
                            
                        }
                        
                        
                    }
                    else{
                        if xa>xb{
                            if xa==30{
                                x.text="胜利"
                                y.text="失败"
                                aa = aa + 1
                                
                                if aa == 2{
                                    game.text="Game Over"
                                    xa = 0
                                    x.text = ""
                                    xb = 0
                                    y.text = ""
                                    aa = 0
                                    bb = 0
                                    
                                }
                                
                            }
                            else{
                                x.text="\(xa)"
                                if xa%2 != 0{
                                    let path = Bundle.main.path(forResource: "13", ofType: "jpg")
                                    let Aleft = UIImage(contentsOfFile: path!)
                                    let imageView = UIImageView(image:Aleft)
                                    self.view.addSubview(imageView)
                                    
                                }
                                else{
                                    let path = Bundle.main.path(forResource: "13", ofType: "jpg")
                                    let Aright = UIImage(contentsOfFile: path!)
                                    let imageView = UIImageView(image:Aright)
                                    self.view.addSubview(imageView)
                                  
                                    
                                }
                            }
                        }
                        else{
                            x.text="\(xa)"
                            if xa%2 != 0{
                                let path = Bundle.main.path(forResource: "13", ofType: "jpg")
                                let Aleft = UIImage(contentsOfFile: path!)
                                let imageView = UIImageView(image:Aleft)
                                self.view.addSubview(imageView)
                            }
                            else{
                                let path = Bundle.main.path(forResource: "13", ofType: "jpg")
                                let Aright = UIImage(contentsOfFile: path!)
                                let imageView = UIImageView(image:Aright)
                                self.view.addSubview(imageView)
                                
                            }
                        }
                    }
                }
                    
                else {
                    x.text="\(xa)"
                    if xa%2 != 0{
                        let path = Bundle.main.path(forResource: "13", ofType: "jpg")
                        let Aleft = UIImage(contentsOfFile: path!)
                        let imageView = UIImageView(image:Aleft)
                        self.view.addSubview(imageView)
                    }
                    else{
                        let path = Bundle.main.path(forResource: "13", ofType: "jpg")
                        let Aright = UIImage(contentsOfFile: path!)
                        let imageView = UIImageView(image:Aright)
                        self.view.addSubview(imageView)

                        
                    }
                }
            }
        }
    }
    @IBAction func markB(_ sender: Any) {
        if dlg==1{
            del=2
            if game.text != "Game Over"{
                y.textAlignment = .center
                xb=xb+1
                if xb>=21{
                    let xbb=xb-2
                    if xbb >= xa{
                        y.text="胜利"
                        x.text="失败"
                        bb = bb + 1
                        xa = 0
                        xb = 0
                        if bb == 2{
                            game.text="Game Over"
                            xb = 0
                            x.text = ""
                            xb = 0
                            y.text = ""
                        }
                    }
                    else{
                        if xb>xa{
                            if xb==30{
                                y.text="胜利"
                                x.text="失败"
                                bb = bb + 1
                               if bb == 2{
                                    game.text="Game Over"
                                    xb = 0
                                    x.text = ""
                                    xb = 0
                                    y.text = ""
                                    aa = 0
                                    bb = 0
                                }
                            }
                            else{
                                y.text="\(xb)"
                                if xb%2 != 0{
                                    let path = Bundle.main.path(forResource: "12", ofType: "jpg")
                                    let Bleft = UIImage(contentsOfFile: path!)
                                    let imageView = UIImageView(image:Bleft)
                                    self.view.addSubview(imageView)
                                                                   }
                                else{
                                    let path = Bundle.main.path(forResource: "12", ofType: "jpg")
                                    let Bright = UIImage(contentsOfFile: path!)
                                    let imageView = UIImageView(image:Bright)
                                    self.view.addSubview(imageView)
                                   
                                }
                            }
                        }
                        else{
                            y.text="\(xb)"
                            if xb%2 != 0{
                                let path = Bundle.main.path(forResource: "12", ofType: "jpg")
                                let Bleft = UIImage(contentsOfFile: path!)
                                let imageView = UIImageView(image:Bleft)
                                self.view.addSubview(imageView)
                                
                            }
                            else{
                                let path = Bundle.main.path(forResource: "12", ofType: "jpg")
                                let Bright = UIImage(contentsOfFile: path!)
                                let imageView = UIImageView(image:Bright)
                                self.view.addSubview(imageView)
                            }
                        }
                    }
                }
                else {
                    y.text="\(xb)"
                    if xb%2 != 0{
                        let path = Bundle.main.path(forResource: "12", ofType: "jpg")
                        let Bleft = UIImage(contentsOfFile: path!)
                        let imageView = UIImageView(image:Bleft)
                        self.view.addSubview(imageView)
                        
                    }
                    else{
                        let path = Bundle.main.path(forResource: "12", ofType: "jpg")
                        let Bright = UIImage(contentsOfFile: path!)
                        let imageView = UIImageView(image:Bright)
                        self.view.addSubview(imageView)
                   }
                }
            }
        }
        
    }
    @IBAction func begin(_ sender: Any) {
     
            if dlg==0{
                dlg=1
                if xa==0{
                    if xb==0{
                        x.textAlignment = .center
                        y.textAlignment = .center
                        vs.textAlignment = .center
                        vs.textAlignment = .center
                        game.textAlignment = .center
                        vs.text = ":"
                        x.text = "0"
                        y.text = "0"
                        vs.text = "VS"
                        game.text = ""
                        let temp = Int(arc4random()%100)+1
                        if temp%2==0{
                            let path = Bundle.main.path(forResource: "12", ofType: "jpg")
                            let Bright = UIImage(contentsOfFile: path!)
                            let imageView = UIImageView(image:Bright)
                            self.view.addSubview(imageView)
                           
                        }
                        else{
                            let path = Bundle.main.path(forResource: "12", ofType: "jpg")
                            let Aright = UIImage(contentsOfFile: path!)
                            let imageView = UIImageView(image:Aright)
                            self.view.addSubview(imageView)
                       }
                        
                    }
                }
            }
        }
    
    @IBAction func del(_ sender: Any) {
        if dlg==1{
            if game.text==""{
                if del==1{
                    if xa>=1{
                        xa=xa-1
                        x.text="\(xa)"
                        del=0
                    }
                }
                else if del==2{
                    if xb>=1{
                        xb=xb-1
                        y.text="\(xb)"
                        del=0
                    }
                }
            }
        }

    }
    @IBAction func finish(_ sender: Any) {
        if dlg==1{
            if game.text=="Game Over"{
                x.text=""
                y.text=""
                vs.text = ""
                vs.text = ""
                dlg=0
                game.text=""
                xa=0
                xb=0
                flagA=0
                flagB=0
                
            }
        }
    }
}
    
    
    
    
    
    

