//
//  ViewController.swift
//  QuotePro
//
//  Created by Jaewon Kim on 2017-08-30.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import UIKit

class ViewController: UIViewController,PhotoQuoteDelegate,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    var photoQuoteArray:Array = [PhotoQuote]()
    var snapShoptArray:Array = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }
    
    func myPhotoQuote(photoQuote: PhotoQuote) {
        photoQuoteArray.append(photoQuote)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toQuoteView" {
            let vc =  segue.destination as! QuoteViewController
            
            vc.delegate = self
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.photoQuoteArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? CustomTableViewCell
            
            cell?.myQuoteView.authorLabel.text = photoQuoteArray[indexPath.row].quote.quoteAuthor
            cell?.myQuoteView.quoteLabel.text = photoQuoteArray[indexPath.row].quote.quoteText
            cell?.myQuoteView.imageView.image = photoQuoteArray[indexPath.row].photo.image
        
        
            return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        

        
        let quoteView = QuoteView(frame: CGRect(x: 0, y: 0, width: photoQuoteArray[indexPath.row].photo.image.size.width, height: photoQuoteArray[indexPath.row].photo.image.size.width));
        
        quoteView.quoteLabel.text = photoQuoteArray[indexPath.row].quote.quoteText
        quoteView.authorLabel.text = photoQuoteArray[indexPath.row].quote.quoteAuthor
        quoteView.imageView.image = photoQuoteArray[indexPath.row].photo.image
        
        quoteView.drawHierarchy(in: CGRect(x: self.view.bounds.width, y: self.view.bounds.height, width: photoQuoteArray[indexPath.row].photo.image.size.width, height: photoQuoteArray[indexPath.row].photo.image.size.width), afterScreenUpdates: true)

        let image = snapShot(view: quoteView)
        
        let activityVC = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        activityVC.popoverPresentationController?.sourceView = self.view
        self.present(activityVC, animated: true, completion: nil)
    //        let iv = UIImageView(image: image)
//        self.view.addSubview(iv)
//        self.view.bringSubview(toFront: iv)
    }
    
    func snapShot(view:UIView)->UIImage{
        
        UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, 0)
        view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        let image:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndPDFContext()
        
        return image
    }
    
}
    


