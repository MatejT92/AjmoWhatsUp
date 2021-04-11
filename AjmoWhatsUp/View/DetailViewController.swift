//
//  DetailViewController.swift
//  AjmoWhatsUp
//
//  Created by Matej Terek on 11/04/2021.
//

import UIKit

class DetailViewController: UIViewController, UIBarPositioningDelegate {

    @IBOutlet var navigationBar: UINavigationBar!
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var headerImageView: UIImageView!
    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var dateLabel: UILabel!
    //assigned data from parent controller
    var eventData = EventData()

    override func viewDidLoad() {
        super.viewDidLoad()
        loadTableViewContent()
    }

    func loadTableViewContent(){
        //Load content sended from parent controller
        titleLabel.text = eventData.title
        descriptionLabel.text = eventData.description
        dateLabel.text = eventData.createdAt?.formatDate()
        //safe load header image
        self.headerImageView.loadImageUsingCache(imagePath: eventData.imageUrl ?? "" , completionHandler: {
            _ in
        })
        //set navigation bar gradient bg color
        navigationBar.setGradientBackground(colors: navigationBar.getNavigationGradientColors())
    }

    @IBAction func shareButtonAction() {
        let textToShare = "\(eventData.title ?? "") \n \(eventData.shareLink ?? "")"
        let objectsToShare = [textToShare] as [Any]
        let activityVC = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
        self.present(activityVC, animated: true, completion: nil)
    }

    //Closing View Controller with animation
    @IBAction func backButtonAction() {
        //Transition Animation
        let transition = CATransition().customTransition(fromLeft: true)
        view.window!.layer.add(transition, forKey: kCATransition)
        dismiss(animated: false, completion: nil)
    }

    //attach navigation bar to top of the status bar
    func position(for bar: UIBarPositioning) -> UIBarPosition{
        return .topAttached
    }

}
