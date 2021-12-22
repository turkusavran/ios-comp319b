//
//  ChatViewController.swift
//  Chatter
//
//  Created by Türkü on 18.12.2019.
//  Copyright © 2019 Calypso. All rights reserved.
//

import UIKit
import Firebase

extension ChatViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "ChatCell", for: indexPath) as! ChatCell
        
        if let savedColor = UserDefaults.standard.color(forKey: "chatBackgroundColor") {
            cell.contentView.backgroundColor = savedColor
            
        }
        let savedTextSize = UserDefaults.standard.integer(forKey: "selectedTextSize")
        
        if (savedTextSize != 0){
            cell.label.font = cell.label.font.withSize(CGFloat(savedTextSize))
            cell.senderLabel.font = cell.senderLabel.font.withSize(CGFloat(savedTextSize))
            cell.meLabel.font = cell.meLabel.font.withSize(CGFloat(savedTextSize))
        }
        
        cell.label.text = messages[indexPath.row].body
        cell.senderLabel.text = messages[indexPath.row].sender
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.meLabel.isHidden = false
            cell.senderLabel.isHidden = true
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = UIColor(named: "homeColor")
        } else {
            cell.meLabel.isHidden = true
            cell.senderLabel.isHidden = false
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = UIColor.white
        }
        return cell
    }
}

class ChatViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var textView: UIView!
    @IBOutlet var chatView: UIView!
    
    var messages: [Message] = []
    
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        if let savedColor = UserDefaults.standard.color(forKey: "chatBackgroundColor") {
            tableView.backgroundColor = savedColor
            view.backgroundColor = savedColor
        }
        
        tableView.dataSource = self
        tableView.register(UINib(nibName: "ChatCell", bundle: nil), forCellReuseIdentifier: "ChatCell")
        loadMessagesData()
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection("messages").addDocument(data: [
                "sender": messageSender,
                "body": messageBody,
                "date": Date().timeIntervalSince1970])
            { (error) in
                if let e = error {
                    let alert = UIAlertController(title: "Invalid authentication", message: e.localizedDescription, preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                    
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        self.messageTextField.text = ""
    }
    
    func loadMessagesData() {
        db.collection("messages").order(by: "date").addSnapshotListener  { (querySnapshot, error) in
            self.messages = []
            
            if let e = error {
                let alert = UIAlertController(title: "Invalid authentication", message: e.localizedDescription, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
                
                self.present(alert, animated: true, completion: nil)
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data["sender"] as? String, let messageBody = data["body"] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                            }
                        }
                    }
                }
            }
        }
    }
}
