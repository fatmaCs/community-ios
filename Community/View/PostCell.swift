//
//  PostCell.swift
//  Community
//
//  Created by Fatma on 03/02/2021.
//

import UIKit

class PostCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var postBubble: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        postBubble.layer.cornerRadius = postBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
      
    }
    
}
