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
    @IBOutlet weak var difficultyLabel: UILabel!
    @IBOutlet weak var constraintScoreProgressWidth: NSLayoutConstraint!
    
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
        
        // Difficulty
        difficultyLabel.text = task.difficulty.resultString()
        difficultyLabel.transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        if let diffBGView = difficultyLabel.superview {
            diffBGView.backgroundColor = task.difficulty.color()
        }
        
        // Progress
        guard let progressBar = progressScoreLabel.superview, let progressBG  = progressBar.superview else { return }
        
        // 최대 가로 길이는 bg.width - progresslabel.width
        let maxProgressWidth = progressBG.bounds.width - (progressScoreLabel.bounds.width + 8)
        
        constraintScoreProgressWidth.constant = CGFloat(100 - task.score * 100 / task.maxScore) / 100 * maxProgressWidth
        progressBar.backgroundColor = task.scoreLevel.color()
    }
    
    func runTask() {
        task?.object?.compile()
    }
    @IBAction func openResult(_ sender: Any) {
        guard let urlString = task?.link, let url = URL(string: urlString) else { return }
        
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        configureView()
    }
    
    var task: TaskModel? {
        didSet {
            // Run task
            runTask()
        }
    }
}
