//
//  ViewController.swift
//  Prueba de buzon
//
//  Created by Jonathan Daniel Hernandez Vega on 7/5/21.
//  Copyright © 2021 Jonathan Daniel Hernandez Vega. All rights reserved.
//

import UIKit
import Firebase

let reachability = try! Reachability()

class ViewController: UIViewController {
    

    @IBOutlet weak var quejas: UIButton!
    @IBOutlet weak var consulta: UIButton!
    @IBOutlet weak var casosresueltos: UILabel!
    @IBOutlet weak var manual: UIButton!
    var ref = Database.database().reference()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        quejas.layer.cornerRadius = 20
        consulta.layer.cornerRadius = 20 //personaliza botones
        
        
        reachability.whenReachable = { _ in
                
                self.contador()
                self.quejas.isEnabled = true
                self.consulta.isEnabled = true
        
        }
        
        reachability.whenUnreachable = { _ in
                
                self.quejas.isEnabled = false
                self.consulta.isEnabled = false
                self.casosresueltos.text = "0"
                self.showAlert()
        }
        
        do {
            try reachability.startNotifier()
        } catch {
            print("Ocurrió un error")
        }
        
    }
    deinit {
        reachability.stopNotifier()

    }
    
    func contador(){
        let query = self.ref.child("Quejas y Sugerencias").queryOrdered(byChild: "Status").queryStarting(atValue: "Resuelto")
        
        query.observeSingleEvent(of: .value) { (snapshot) in
            guard snapshot.exists() != false else { return }
            let casosR = snapshot.childrenCount
            self.casosresueltos.text = "\(casosR)"
        }
    }
    
    func showAlert(){
        let alert = UIAlertController(title: "No Internet", message: "Necesitas una conexión a internet", preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("Ok")
        }))
        self.present(alert, animated: true, completion: nil)
    }
    
}

