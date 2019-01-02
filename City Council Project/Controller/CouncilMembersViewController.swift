//
//  ViewController.swift
//  City Council Project
//
//  Created by Jabeen's MacBook on 12/24/18.
//  Copyright © 2018 Jabeen's MacBook. All rights reserved.
//

import UIKit

class CouncilMembersViewController: UIViewController {

    
    @IBOutlet weak var CMTableView: UITableView!
    
    
    var members = [CouncilMember](){  // didSet, every time this var gets modified do something, which we are because I want infor for 51 members and the DispatchQueue is reloading the data
        didSet{
            DispatchQueue.main.async {
                //self.nameoftableview.reloadData{}
            self.CMTableView.reloadData() // once the members get modified, refresh, reload the table view
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        CMTableView.dataSource = self 
        CityCouncilAPIClient.getCouncilMembers{(member, error) in
            DispatchQueue.main.async {
                if let error = error {
                    print(error)
                }
                if let member = member {
                    self.members = member
                    //dump(member) // this prints the data to the console
                }
                
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let indexPath = CMTableView.indexPathForSelectedRow, let cmDetailedViewController = segue.destination as? CMDetailedViewController else { return }
        let councilMember = members [indexPath.row]  // capturing the one you clicked on 
        cmDetailedViewController.councilMember = councilMember
        }
    }


extension CouncilMembersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return members.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let memberToSet = members[indexPath.row] // each cell has a row, the row matches the array of members I have, the first cell is for the first member...
        let cell = CMTableView.dequeueReusableCell(withIdentifier: "CouncilMemberCell", for: indexPath)
        cell.textLabel?.text = memberToSet.memberName
        cell.detailTextLabel?.text = memberToSet.borough
        return cell
    }
}
