//
//  DetailViewController.swift
//  CodingTest
//
//  Created by Moojong Song on 10/06/2019.
//  Copyright © 2019 Moojong Song. All rights reserved.
//

import UIKit
import SafariServices

class DetailViewController: UIViewController {

    @IBOutlet weak var detailDescriptionLabel: UILabel!
    @IBOutlet weak var taskDetailsSubjectLabel: UILabel!
    @IBOutlet weak var taskDetailsGoalLabel: UILabel!
    @IBOutlet weak var resultScoreLabel: UILabel!
    @IBOutlet weak var bigScoreLabel: UILabel!
    @IBOutlet weak var progressScoreLabel: UILabel!
    @IBOutlet weak var constaintScoreProgressEqualWidth: NSLayoutConstraint!
    
    func configureView() {
        // Update view for the task info
        guard let task = task else { return }
        self.title = "\(task.level). \(task.title)"
        
        if let label = detailDescriptionLabel {
            label.text = task.object?.question
        }
        if let label = taskDetailsSubjectLabel {
            label.text = task.title
        }
        if let label = taskDetailsGoalLabel {
            label.text = task.description
        }
        if let label = bigScoreLabel {
            label.text = "\(task.score * 100 / task.maxScore)%"
        }
        if let label = progressScoreLabel {
            label.text = "\(task.score * 100 / task.maxScore)%"
        }
        if let label = resultScoreLabel {
            label.text = "\(task.score) out of \(task.maxScore) points"
        }
        if let label = resultScoreLabel {
            label.text = "\(task.score) out of \(task.maxScore) points"
        }
    }
    
    func runTask() {
        task?.object?.compile()
    }
    @IBAction func openResult(_ sender: Any) {
        guard let urlString = task?.link, let url = URL(string: urlString) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    public class func changeMultiplier(constraint: NSLayoutConstraint, multiplier: CGFloat) -> NSLayoutConstraint {
        let newConstraint = NSLayoutConstraint(
            item: constraint.firstItem,
            attribute: constraint.firstAttribute,
            relatedBy: constraint.relation,
            toItem: constraint.secondItem,
            attribute: constraint.secondAttribute,
            multiplier: multiplier,
            constant: constraint.constant)
        
        newConstraint.priority = constraint.priority
        NSLayoutConstraint.deactivate([constraint])
        NSLayoutConstraint.activate([newConstraint])
        return newConstraint
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        configureView()
    }
    
    var task: TaskModel? {
        didSet {
            // Run task
            runTask()
        }
    }
}
