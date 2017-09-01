//
//  CustomTableViewCell.swift
//  QuotePro
//
//  Created by Jaewon Kim on 2017-08-30.
//  Copyright © 2017 Jaewon Kim. All rights reserved.
//

import UIKit

class CustomTableViewCell: UITableViewCell {


    @IBOutlet weak var myQuoteView: QuoteView!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
