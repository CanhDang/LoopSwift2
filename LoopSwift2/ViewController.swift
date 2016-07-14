//
//  ViewController.swift
//  LoopSwift2
//
//  Created by HuuLuong on 7/14/16.
//  Copyright © 2016 CanhDang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tf_number: UITextField!
    
    
    let margin:CGFloat = 50
    let marginTop:CGFloat = 30
    
    var numberOfBall: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tf_number.layer.borderWidth = 1
        tf_number.layer.borderColor = UIColor.blackColor().CGColor
        
        
    }
    
    func drawBalls(){
        for indexRow in 0..<numberOfBall{
                for indexColumn in 0..<numberOfBall {
                    let image = UIImage(named: "green")
                    let ball = UIImageView(image: image)
                    ball.center = CGPointMake(margin + CGFloat(indexColumn) * spaceBetweenColumn(), margin + marginTop + CGFloat(indexRow) * spaceBetweenRow())
                    
                    self.view.addSubview(ball)
                }
           
        }
        
        
    }
    
    func spaceBetweenColumn()-> CGFloat{
        
        let space = (self.view.bounds.size.width - 2 * margin)/(CGFloat(numberOfBall-1))
        
        return space
    }

    func spaceBetweenRow() -> CGFloat {
        let space = (self.view.bounds.size.height - marginTop - 2 * margin)/(CGFloat(numberOfBall-1))
        
        return space
    }
    
    @IBAction func action_draw(sender: AnyObject) {
        
        for view in self.view.subviews{
            if view is UIImageView {
                view.removeFromSuperview()
            }
        }
        
        if let tempNumber = Int(tf_number.text!) {
            
            if tempNumber > 0 {
                
                numberOfBall = tempNumber
                
                if numberOfBall == 1{
                    
                    drawOneBall()
                } else{
                
                    drawBalls()
                }
            } else {
                print("invalid number")
            }
            
        } else {
            print("invalid number")
        }
        
    }
    
    func drawOneBall() {
        
        let image = UIImage(named: "green")
        let ball = UIImageView(image: image)
        ball.center = CGPointMake(self.view.bounds.size.width / 2 , (self.view.bounds.size.height-marginTop) / 2 )
        
        self.view.addSubview(ball)

    }

}

