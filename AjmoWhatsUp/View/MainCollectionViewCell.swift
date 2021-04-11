//
//  MainCollectionViewCell.swift
//  AjmoWhatsUp
//
//  Created by Matej Terek on 09/04/2021.
//

import UIKit

class MainCollectionViewCell: UICollectionViewCell {

    var cellIndex: Int = 0
    @IBOutlet var headerImgView: UIImageView!
    @IBOutlet var eventTitleLabel: UILabel!
    @IBOutlet var eventSubTitleLabel: UILabel!
    @IBOutlet var eventDateLabel: UILabel!

    //load recived data for speciffic collection view cell
    func configureCell(objectData: EventData){
        self.eventTitleLabel.text = objectData.title
        self.eventSubTitleLabel.text = objectData.caption
        self.eventDateLabel.text = objectData.createdAt?.formatDate()
        //safe load/download image
        self.headerImgView.loadImageUsingCache(imagePath: objectData.imageUrl ?? "" , completionHandler: {
            _ in
        })
    }

}
