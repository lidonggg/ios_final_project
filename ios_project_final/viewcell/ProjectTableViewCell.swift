//
//  ProjectTableViewCell.swift
//  ios_project_final
//
//  Created by LS J on 2018/5/31.
//  Copyright © 2018年 LS J. All rights reserved.
//

import UIKit

class ProjectTableViewCell: UITableViewCell {

    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var leader: UILabel!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet weak var desc: UILabel!
    
    var p:Project? {
        didSet{
            title.text = p?.title
            leader.text = p?.leader
            startTime.text = p?.startTime
            desc.text = p?.desc
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
