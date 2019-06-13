//
//  MasterViewController.swift
//  CodingTest
//
//  Created by Moojong Song on 10/06/2019.
//  Copyright © 2019 Moojong Song. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {

    var detailViewController: DetailViewController? = nil
    var lessons = [LessonModel]()
    var tasks = [[TaskModel]]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        if let split = splitViewController {
            let controllers = split.viewControllers
            detailViewController = (controllers[controllers.count-1] as! UINavigationController).topViewController as? DetailViewController
        }
        
        self.title = "CODILITY"
        
        setData()
    }
    
    func setData() {
        // Load Codility Data
        CodilityContent.loadContent(lessons: &lessons, tasks: &tasks)
    }
    
    @objc func close() {
        self.dismiss(animated: true, completion: nil)
    }

    override func viewWillAppear(_ animated: Bool) {
        clearsSelectionOnViewWillAppear = splitViewController!.isCollapsed
        super.viewWillAppear(animated)
    }

    // MARK: - Segues

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            if let indexPath = tableView.indexPathForSelectedRow {
                let task = tasks[indexPath.section][indexPath.row]
                let controller = (segue.destination as! UINavigationController).topViewController as! DetailViewController
                controller.task = task
                controller.navigationItem.leftBarButtonItem = splitViewController?.displayModeButtonItem
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }

    // MARK: - Table View

    override func numberOfSections(in tableView: UITableView) -> Int {
        return lessons.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        let task = tasks[indexPath.section][indexPath.row]
        let titleString = "[\(task.score)%] \(task.title)"
        let colorString = "\(task.score)%"
        let range = (titleString as NSString).range(of: colorString)
        let attributedString = NSMutableAttributedString(string: titleString)
        attributedString.addAttribute(.foregroundColor, value: UIColor(red:0.07, green:0.42, blue:0.64, alpha:1.00), range: NSRange(location: 0, length: titleString.count))
        attributedString.addAttribute(.foregroundColor, value: UIColor.colorWithScore(task.score), range: range)
        
        cell.textLabel?.attributedText = attributedString
        cell.detailTextLabel?.text = task.description
        cell.detailTextLabel?.textColor = UIColor.gray
        return cell
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return lessons[section].titleString()
    }

}

extension UIColor {
    static func colorWithScore(_ score: Int) -> UIColor {
        var color = UIColor.green
        if score > 80 {
            // good
            color = UIColor(red:0.16, green:0.65, blue:0.10, alpha:1.00)
        }else if score > 40 {
            // partial
            color = UIColor(red:0.99, green:0.67, blue:0.17, alpha:1.00)
        }else {
            // poor
            color = UIColor(red:0.72, green:0.00, blue:0.00, alpha:1.00)
        }
        
        return color
    }
}
