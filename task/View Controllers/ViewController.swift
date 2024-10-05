//
//  ViewController.swift
//  task
//
//  Created by Ios Dev on 10/5/24.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var searchVIew: UIView!
    @IBOutlet weak var btnSegmentation: UISegmentedControl!
    @IBOutlet weak var btnPro: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var bottomView: UIView!
    
    var categoryArry = ["Featured", "For You", "Birthday"]
    var lifestyleImages = ["fe_1", "fe_2", "fe_1"]
    var fashionImages = ["bir_2", "last_1", "for_1", "bir_2", "last_1", "for_1"]
    var sportsImages = ["bir_2", "for_1", "last_1", "bir_2", "last_1", "for_1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnPro.layer.cornerRadius = 12
        
        configureSegmentationButton(btnSegmentation)
        configureSearchView(searchVIew)
        
        bottomView.layer.shadowColor = UIColor.black.cgColor
        bottomView.layer.shadowOpacity = 0.6
        bottomView.layer.shadowOffset = CGSize(width: 0, height: 4)
        bottomView.layer.shadowRadius = 10
        bottomView.layer.masksToBounds = false
        
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.showsHorizontalScrollIndicator = false
        tableView.allowsSelection = false
    }
    
    // Button tap animation
    func animateButtonPress(_ button: UIButton) {
        UIView.animate(withDuration: 0.2, animations: {
            button.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }) { (_) in
            UIView.animate(withDuration: 0.2) {
                button.transform = CGAffineTransform.identity
            }
        }
    }
    @IBAction func btnProTapped(_ sender: UIButton) {
        animateButtonPress(sender)
    }

    @IBAction func btnNewProject(_ sender: UIButton) {
        animateButtonPress(sender)
    }

    
    @IBAction func btnFolder(_ sender: Any) {
        animateButtonPress(sender as! UIButton)

    }
    @IBAction func btnMenue(_ sender: UIButton) {
        animateButtonPress(sender)
    }
    
    @IBAction func btnHome(_ sender: UIButton) {
        animateButtonPress(sender)
    }
    func configureSegmentationButton(_ button: UISegmentedControl) {
        button.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        let fontSize = UIDevice.current.userInterfaceIdiom == .pad ? 20 : 12
        let normalAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.gray,
            .font: UIFont(name: "Switzer-Bold", size: CGFloat(fontSize)) ?? UIFont.systemFont(ofSize: CGFloat(fontSize))
        ]
        button.setTitleTextAttributes(normalAttributes, for: .normal)
        
        let selectedAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.white,
            .font: UIFont.boldSystemFont(ofSize: CGFloat(fontSize))
        ]
        button.setTitleTextAttributes(selectedAttributes, for: .selected)
    }
    
    func configureSearchView(_ view: UIView) {
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        view.layer.borderColor = UIColor.lightGray.cgColor
        view.layer.borderWidth = 1.0
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        searchVIew.transform = CGAffineTransform(translationX: 0, y: -searchVIew.frame.height)
        searchVIew.alpha = 0
        
        UIView.animate(withDuration: 0.5, animations: {
            self.searchVIew.transform = .identity
            self.searchVIew.alpha = 1
        })
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return categoryArry.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var baseHeight: CGFloat
        if indexPath.row == 0 {
            baseHeight = UIDevice.current.userInterfaceIdiom == .pad ? 300 : 150
        } else {
            baseHeight = UIDevice.current.userInterfaceIdiom == .pad ? 400 : 200
        }
        
        if UIScreen.main.nativeBounds.height >= 2500 {
            baseHeight += 40
        }
        
        return baseHeight
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "TemplateTableViewCell", for: indexPath) as? TemplateTableViewCell else {
            fatalError("Unable to dequeue TemplateTableViewCell")
        }
        
        cell.lblCategory.text = categoryArry[indexPath.section]
        
        switch indexPath.section {
        case 0:
            cell.images = lifestyleImages
            cell.lblSeeAll.isHidden = true
        case 1:
            cell.images = fashionImages
        case 2:
            cell.images = sportsImages
        default:
            break
        }
        
        // Apply fade-in animation to the entire cell
        cell.alpha = 0
        UIView.animate(withDuration: 0.5, animations: {
            cell.alpha = 1
        })
        
        return cell
    }
}
