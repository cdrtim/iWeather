//
//  ViewController.swift
//  iWeather
//
//  Created by Pham Ngoc Hai on 11/7/16.
//  Copyright © 2016 Mystudio. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var Lbl_CF: UILabel!
    @IBOutlet weak var Img_background: UIImageView!
   
    @IBOutlet weak var But_temp: UIButton!
    
    @IBOutlet weak var Lbl_City: UILabel!
  
   
    @IBOutlet weak var lbl_quote: UILabel!
    
    var quote = ["Since we cannot change reality, let us change the eyes which see reality.",
                "Without a struggle, there can be no progress.",
                "If you don't like something, change it. If you can't change it, change your attitude."]
    
    var city = ["Courtneyfurt",
                "South Wilford",
                "East Rosendo"]
    
    var backGroundImageView = ["Blood","Moon","Sun"]
    
    var rdCtoF : Bool = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    
    @IBAction func But_CtoF(_ sender: AnyObject) {
   
        rdCtoF = !rdCtoF
        
        var currentTemp = Double((But_temp.titleLabel?.text)!)
        
        if rdCtoF {
            currentTemp = (currentTemp! - 32) / 1.8
            
            But_temp.setTitle(String(format: "%2.1f", currentTemp!), for: UIControlState())
            
            Lbl_CF.text = "C"
        }else{
            currentTemp = currentTemp! * 1.8 + 32
            
            But_temp.setTitle(String(format: "%2.1f", currentTemp!), for: UIControlState())
            
            Lbl_CF.text = "F"
        }
    }
    
    

    
    
    @IBAction func But_Ref(_ sender: AnyObject) {
    
    let cityindex = Int(arc4random_uniform(UInt32(city.count)))
    Lbl_City.text = city[cityindex]
    
    let quouteIndex = Int(arc4random_uniform(UInt32(quote.count)))
    lbl_quote.text = quote[quouteIndex]
        
    let imageIndex = Int(arc4random_uniform(UInt32(backGroundImageView.count)))
        Img_background.image = UIImage.init(imageLiteralResourceName: backGroundImageView[imageIndex])
        
     getTemp()
    }
    func getTemp() -> Void {
        let temp = String(format: "%2.1f", tempRandom())
        But_temp.setTitle(temp, for: UIControlState())
    }
    
    func tempRandom() -> Double {
       
        if rdCtoF {
            return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
        }else{
            return (Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)) * 1.8 + 32    }
    
        
        }

}

