//
//  StartViewController.swift
//  CALHAX
//
//  Created by Nabeel Mamoon on 10/7/17.
//  Copyright © 2017 Nabeel Mamoon. All rights reserved.
//

import UIKit
import QuartzCore
import AVFoundation


class StartViewController: UIViewController, UITextViewDelegate {
    
    
    @IBOutlet weak var OutPutBox: UITextView!
    
    @IBOutlet weak var AppName: UILabel!
    
    @IBOutlet weak var TextBox: UITextView!
    
    @IBOutlet weak var TitleLabel: UILabel!
    
    
    @IBOutlet weak var inputbutton: UIButton!
    
    @IBOutlet weak var outputbutton: UIButton!
    

    
    var typing = false
    
    
    
    
    
    override func viewDidAppear(_ animated: Bool) {
        
        OutPutBox.layer.masksToBounds = true
     
        TextBox.layer.masksToBounds = true
        TextBox.delegate = self
        TextBox.layer.borderColor = UIColor.green.cgColor
        TextBox.layer.borderWidth = 2.0
     
        
        
        
        OutPutBox.layer.borderColor = UIColor.green.cgColor
        OutPutBox.layer.borderWidth = 2.0
        
        
        OutPutBox.layer.cornerRadius = 10
        OutPutBox.isEditable = false
        TextBox.layer.cornerRadius = 10
        inputbutton.layer.cornerRadius = 10
        inputbutton.backgroundColor = UIColor(hue: 0.2306, saturation: 0.26, brightness: 0.99, alpha: 1.0)
        outputbutton.layer.cornerRadius = 10
        outputbutton.backgroundColor = UIColor(hue: 0.2306, saturation: 0.26, brightness: 0.99, alpha: 1.0)
        
        
        TitleLabel.layer.masksToBounds = true
        TitleLabel.layer.cornerRadius = 10
        TitleLabel.backgroundColor = UIColor(hue: 0.2306, saturation: 0.26, brightness: 0.99, alpha: 1.0)
        

    }
    
  /*
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        let mutableAttributedString = NSMutableAttributedString(string: utterance.speechString)
        mutableAttributedString.addAttribute(NSForegroundColorAttributeName, value: UIColor.green, range: characterRange)
        OutPutBox.attributedText = mutableAttributedString
    }
    
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        OutPutBox.attributedText = NSAttributedString(string: utterance.speechString)
    }
 
 */
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        //PostBox.text = ""
        if !typing {
            print("AAAA")
            TextBox.becomeFirstResponder()
            //print("here")
            outputbutton.backgroundColor = UIColor.green
        }
        else {
            //print("here")
            print("BBB")
            TextBox.becomeFirstResponder()
        }
        
    }
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
    @IBAction func OutputPressed(_ sender: UIButton) {
        
        TextBox.endEditing(true)
        outputbutton.backgroundColor = UIColor(hue: 0.2306, saturation: 0.26, brightness: 0.99, alpha: 1.0)
        
        
        
        
        
        
        var textToSimplify = TextBox.text
        
        
        /*
        let parameters = ["link": "http://techcrunch.com/2015/04/06/john-oliver-just-changed-the-surveillance-reform-debate"] as [String : String]
        
        //create the url with URL
        let url = URL(string: "http://simpl-182222.appspot.com/simpl/url")! //change the url
        
        //create the session object
        let session = URLSession.shared
        
        //now create the URLRequest object using the url object
        var request = URLRequest(url: url)
        request.httpMethod = "POST" //set http method as POST
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
        } catch let error {
            print(error.localizedDescription)
        }
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //create dataTask using the session object to send data to the server
        
        
        
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in
            
            guard error == nil else {
                return
            }
            
            guard let data = data else {
                return
            }
            
            do {
                //create json object from data
                if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                    print(json)
                    // handle json...
                    var text = json["return"] as! String
                    self.OutPutBox.text = text
                    let string = self.OutPutBox.text!
                   // let utterance = AVSpeechUtterance(string: string)
                   // utterance.voice = AVSpeechSynthesisVoice(language: "en-GB")
                    
                   // let synthesizer = AVSpeechSynthesizer()
                   // synthesizer.delegate = self
                    //synthesizer.speak(utterance)
                    
                    
                }
            } catch let error {
                print(error.localizedDescription)
            }
        })
        task.resume()
         */
        
        var bullshit = "Although the Snowden leaks certainly proved to be much more than a “three-day story,” American surveillance practices remain largely the same two years later. Oliver’s interview is timely as we approach an important deadline for surveillance reform on June 1."
        
        
      
        var responseValue: String?
        print("A")
        var request = URLRequest(url: URL(string: "https://simpl-182222.appspot.com/simpl/url")!)
         print("B")
        request.httpMethod = "POST"
        let postString = "link=\(textToSimplify)"
        request.httpBody = postString.data(using: .utf8)
         print("C")
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            guard let data = data, error == nil else {
            
                // check for fundamental networking error
                print("error=\(String(describing: error))")
                return
            }
            
            if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                print("statusCode should be 200, but is \(httpStatus.statusCode)")
                print("response = \(String(describing: response))")
            }
            
            let responseString = String(data: data, encoding: .utf8)
            print("responseString = \(String(describing: responseString))")
            responseValue = responseString
            self.OutPutBox.text = responseValue!
        }
        task.resume()
 
 
        
      
        
        
        
        
        
        
        
        
        
    }
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
