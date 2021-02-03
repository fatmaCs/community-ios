//
//  HomeViewController.swift
//  Community
//
//  Created by Fatma on 02/02/2021.
//

//present all posts form all userS ???????????????????
import UIKit
import Firebase

class HomeViewController: UIViewController {


    @IBOutlet weak var tableView: UITableView!
    let db =  Firestore.firestore()
    
    var posts: [Posts] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
       // title = "Community"
        navigationItem.hidesBackButton = true
        
        tableView.register(UINib(nibName: "PostCell", bundle: nil), forCellReuseIdentifier: "ReasableCell")
        
        loadMessage()
    }
    
    func loadMessage(){
        db.collection("posts")
            .order(by: "data")
            .addSnapshotListener { (querySnapShot, error) in
                
              //  self.posts = [] //refresh
                
                if let e = error{
                    print("There was an issue retraiving data from firestore \(e)")
                } else {
                    
                    if let snapShotcocuments = querySnapShot?.documents {
                        for doc in snapShotcocuments {
                            print(doc)
                            let data = doc.data()
                            print(data)
                            if let sender = data["sender"] as? String,
                               let postBody = data["body"] as? String {
                                
                                let newPost = Posts(sender: sender, body: postBody)
                                self.posts.append(newPost)
                                
                                DispatchQueue.main.async {
                                    self.tableView.reloadData()
                                    let indexPath = IndexPath(row: self.posts.count-1, section: 0)
                                    self.tableView.scrollToRow(at: indexPath, at: .top, animated: true)
                                }
                            }
                        }
                    }
                }
                
            }
            
    }
    
    @IBAction func addPressed(_ sender: UIButton) {
       var textField = UITextField()
        
        let alert = UIAlertController(title: "Add Post", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "ADD POST", style: .default) { (action) in
            
           // let newPost = Posts(sender: (Auth.auth().currentUser?.email)!, body: textField.text!)
            
            if let body = textField.text, let sender = Auth.auth().currentUser?.email{
               // print(sender)
                self.db.collection("posts").addDocument(data: ["sender": sender, "body": body, "date": Date().timeIntervalSince1970]) { (error) in
                    if let e = error {
                        print("There was an issue saving data to firestore, \(e)")
                    }else {
                        print("Sucessfully saved data")
                        

                    }
                    
                }
            }
            
           
            
        }
        
        alert.addAction(action)
        
        alert.addTextField { (alertTextField) in
            
            alertTextField.placeholder = "add post"
            textField = alertTextField
            
        }
        
        present(alert, animated: true, completion: nil)
        
    }
    
    
    
}


extension HomeViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return posts.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let post = posts[indexPath.row]
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReasableCell", for: indexPath) as! PostCell
        
        cell.label.text = post.body

        
        
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//
//        performSegue(withIdentifier: "goToChat", sender: self)
//
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//    }
    
    
}
