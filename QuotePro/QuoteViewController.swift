//
//  QuoteViewController.swift
//  QuotePro
//
//  Created by Jaewon Kim on 2017-08-30.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import UIKit

class QuoteViewController: UIViewController {

    @IBOutlet weak var quoteView: QuoteView!
    
    var quoteContainer:Quote = Quote()
    var photoContainer:Photo = Photo()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func randomQuoteButton(_ sender: UIBarButtonItem) {
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "http://api.forismatic.com/api/1.0/?method=getQuote&lang=en&format=json")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let json = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as? [String: Any]
                    {
                        
                        let dict:Dictionary = json
                        self.quoteContainer.quoteText = dict["quoteText"] as! String
                        self.quoteContainer.quoteAuthor = dict["quoteAuthor"] as! String
                        
                        DispatchQueue.main.sync {
                            self.quoteView.setupWithQuote(quote: self.quoteContainer)
                        }
                        
                        print(json)
                        
                    }
                    
                } catch {
                    
                    print("error in JSONSerialization")
                    
                }
                
                
            }
            
        })
        task.resume()

    }
    @IBAction func randomImageButton(_ sender: UIBarButtonItem) {
        
        let config = URLSessionConfiguration.default // Session Configuration
        let session = URLSession(configuration: config) // Load configuration into Session
        let url = URL(string: "http://lorempixel.com/200/300")!
        
        let task = session.dataTask(with: url, completionHandler: {
            (data, response, error) in
            
            if error != nil {
                
                print(error!.localizedDescription)
                
            } else {
                
                do {
                    
                    if let dataResponse = data
                    {
                        print(dataResponse)
                        self.photoContainer.image = UIImage(data: dataResponse)
                        
                        DispatchQueue.main.sync {
                            self.quoteView.imageView.image = self.photoContainer.image
                        }
                        
                    }
                    
                }
            }
            
        })
        task.resume()
        
    }
    

}
