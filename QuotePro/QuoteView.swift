//
//  QuoteView.swift
//  QuotePro
//
//  Created by Jaewon Kim on 2017-08-30.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import UIKit

class QuoteView: UIView {
    @IBOutlet var contentView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var quoteLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!



    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit(){
        
        Bundle.main.loadNibNamed("QuoteView", owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        
    }
    
    func setupWithQuote(quote:Quote){
        
        quoteLabel.text = quote.quoteText
        authorLabel.text = quote.quoteAuthor
        
        
    }

}
