//
//  ViewController.swift
//  CoreData-Task
//
//  Created by Siba on 09/03/20.
//  Copyright © 2020 Mobiotics. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var addDataButton: UIButton!
    @IBOutlet weak var showDataTableView: UITableView!
    var nameArr:[People] = []
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        fetchData()
        showDataTableView.reloadData()
    }
    func fetchData() {
        if let peopleArray = CoreDataManager.shared.fecthPeople() {
            nameArr = peopleArray
        } 
    }


}
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        let cell = showDataTableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let people = nameArr[indexPath.row]
        cell.nameLabel.text = people.name
        cell.countryLabel.text = people.country
        return cell
    }
    
    
}

