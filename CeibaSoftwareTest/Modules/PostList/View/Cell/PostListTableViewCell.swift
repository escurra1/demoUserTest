//
//  PostListTableViewCell.swift
//  CeibaSoftwareTest
//
//  Created by Escurra Colquis on 4/10/22.
//

import UIKit

class PostListTableViewCell: UITableViewCell {
    // MARK: - IBOutlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    
    // MARK: - Properties
    static let nibName = Constants.Cells.listPostCell
    static let sizePostList: CGFloat = Constants.Cells.rowHeightPostListCell
    
    // MARK: Object lifecycle
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
