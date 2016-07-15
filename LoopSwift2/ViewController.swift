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
    var lastOnLed = -1
    
    var count: Int = 1;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tf_number.layer.borderWidth = 1
        tf_number.layer.borderColor = UIColor.blackColor().CGColor
        
        
    }
    
    func drawBalls(){
//        for indexRow in 0..<numberOfBall{
//                for indexColumn in 0..<numberOfBall {
//                    let image = UIImage(named: "green")
//                    let ball = UIImageView(image: image)
//                    ball.center = CGPointMake(margin + CGFloat(indexColumn) * spaceBetweenColumn(), margin + marginTop + CGFloat(indexRow) * spaceBetweenRow())
//                    ball.tag = indexColumn + 100
//                    self.view.addSubview(ball)
//                }
//           
//        }
        
       
        var columnStart = 0;
        var rowStart = 0;
        var columnEnd = numberOfBall-1;
        var rowEnd = numberOfBall-1;
        let total = numberOfBall*numberOfBall
        
        while count <= total {
            for index in columnStart...columnEnd {
                draw(index,row: rowStart)
                count += 1
            }
            
            rowStart += 1
            
            if count <= total{
                for index in rowStart...rowEnd {
                    draw(columnEnd, row: index)
                    count += 1
                }
            }
            
            columnEnd -= 1
            
            if count <= total{
                for (var index = columnEnd; index >= columnStart; index -= 1) {
                    draw(index,row: rowEnd)
                    count += 1
                }
            }
            
            rowEnd -= 1
            
            if count <= total{
                for (var index = rowEnd; index >= rowStart; index -= 1) {
                    draw(columnStart,row: index)
                    count += 1
                }
            }
            
            columnStart += 1
            
        }
    
    }
    
    func draw (column: Int,row: Int){
        let image = UIImage(named: "green")
        let ball = UIImageView(image: image)
        ball.center = CGPointMake(margin + CGFloat(column) * spaceBetweenColumn(), margin + marginTop + CGFloat(row) * spaceBetweenRow())
        ball.tag = 100 + count
        self.view.addSubview(ball)
    }
    
    
    func spaceBetweenColumn()-> CGFloat{
        
        let space = (self.view.bounds.size.width - 2 * margin)/(CGFloat(numberOfBall-1))
        
        return space
    }

    func spaceBetweenRow() -> CGFloat {
        let space = (self.view.bounds.size.height - marginTop - 2 * margin)/(CGFloat(numberOfBall-1))
        
        return space
    }
    
    func drawOneBall() {
        
        let image = UIImage(named: "green")
        let ball = UIImageView(image: image)
        ball.center = CGPointMake(self.view.bounds.size.width / 2 , (self.view.bounds.size.height-marginTop) / 2 )
        ball.tag = 101
        self.view.addSubview(ball)
        
    }
    
    @IBAction func action_draw(sender: AnyObject) {
        
//        lastOnLed = -1
        
        lastOnLed = 0
        
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
                    
                } else {
                    
                    count = 1
                    
                    drawBalls()
                    
                    LED()
                    
                }
            } else {
                print("invalid number")
            }
            
        } else {
            print("invalid number")
        }
        
    }
    

    
    
    func LED(){
        let timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(runningLed), userInfo: nil, repeats: true)
    }
    
    func runningLed(){
        if lastOnLed != 0 {
            turnOffLed()
        }
        
        if (lastOnLed != numberOfBall * numberOfBall){
            lastOnLed = lastOnLed + 1
        } else {
            lastOnLed = 0
        }
        turnOnLed()
    }
    
    func turnOnLed(){
        if let ball = self.view.viewWithTag(100 + lastOnLed)
            as? UIImageView {
            ball.image = UIImage(named: "green")
        }
    }
    
    func turnOffLed(){
        
        if let ball = self.view.viewWithTag(100 + lastOnLed)
            as? UIImageView {
            ball.image  = UIImage(named: "gray")
        }
    }
}

