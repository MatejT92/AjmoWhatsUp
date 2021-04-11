//
//  ViewController.swift
//  AjmoWhatsUp
//
//  Created by Matej Terek on 09/04/2021.
//

import Foundation
import UIKit

class MainViewController: UIViewController {

    var APIURL = "https://api.ajmo.hr/v3/news/index?isPromoted=0" //content loading url
    @IBOutlet var mainCollectionView: UICollectionView!
    var indicator = UIActivityIndicatorView()
    var eventsArray: [EventData] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        //Initialize loading HUD
        initLoadingIndicator()
        //Show loading HUD
        indicator.startAnimating()
        //Start fetching and loading content
        loadContent(fromUrl: APIURL)
        //set collection view shadow
        setCollectionViewShadow()
    }

    //set shadow of collection view cells
    func setCollectionViewShadow(){
        mainCollectionView.contentInset = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 30)
        mainCollectionView.layer.shadowColor = UIColor.black.cgColor
        mainCollectionView.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        mainCollectionView.layer.shadowRadius = 2.0
        mainCollectionView.layer.shadowOpacity = 0.15
        mainCollectionView.layer.masksToBounds = false
    }

}
