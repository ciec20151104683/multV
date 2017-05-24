//
//  ViewController.swift
//  multV
//
//  Created by s20151104683 on 17/5/22.
//  Copyright © 2017年 s20151104683. All rights reserved.
//

import UIKit

class ViewController: UIViewController,
    UIImagePickerControllerDelegate,
UINavigationControllerDelegate{

    @IBOutlet weak var Mmenu: UITextField!
    @IBOutlet weak var peopleA: UIImageView!
    
    @IBOutlet weak var peopleB: UIImageView!
    var dlg=0
    var flagA=0
    var flagB=0
    @IBAction func CHphoto(_ sender: Any) {
        if peopleA.image == nil && peopleB.image != nil {
            let alertController = UIAlertController(title:"系统提示",
                                                    message:"请先上传选手A照片：\n",
                                                    preferredStyle:. alert)
            
            
            //显示显示框
            self.present(alertController,animated: true,completion: nil)
            let okAction = UIAlertAction(title: "",style: .default,handler:{
                action in
                print("")
            })
            alertController.addAction(okAction)
            //5秒钟后自动消失
            DispatchQueue.main.asyncAfter(deadline:DispatchTime.now() + 5) {
                self.presentedViewController?.dismiss(animated: false, completion: nil)
            }
        }
        
    }




    @IBAction func A(_ sender: Any) {
        if dlg==0{
            flagA=1
            flagB=0
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)//初始化图片控制器
            {
                let picker = UIImagePickerController()//设置代理
                picker.delegate = self  //设定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary  //弹出控制器，显示界面
                self.present(picker, animated: true, completion: {() ->Void in})
            }else{
                print("读取相册错误")
            }
        }

    }
    @IBAction func B(_ sender: Any) {
        if dlg==0{
            flagA=0
            flagB=1
            if UIImagePickerController.isSourceTypeAvailable(.photoLibrary)//初始化图片控制器
            {
                let picker = UIImagePickerController()//设置代理
                picker.delegate = self  //设定图片控制器类型
                picker.sourceType = UIImagePickerControllerSourceType.photoLibrary  //弹出控制器，显示界面
                self.present(picker, animated: true, completion: {() ->Void in})
            }else{
                print("读取相册错误")
            }
        }
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        //查看info对象
        print(info)//显示的照片
        let image:UIImage!
        //获取选择的原图
        image = info[UIImagePickerControllerOriginalImage] as!UIImage
        if(flagA==1){
            peopleA.image = image
        }else if(flagB==1){
            peopleB.image = image
        }//
        picker.dismiss(animated: true, completion: {() ->Void in})
    }
    
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

