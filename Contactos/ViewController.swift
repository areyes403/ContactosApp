//
//  ViewController.swift
//  Contactos
//
//  Created by mac17 on 03/05/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    

    @IBOutlet weak var tableContactos: UITableView!
    var enviandoNombre = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableContactos.register(UINib(nibName: "ContactoTableViewCell", bundle: nil), forCellReuseIdentifier: "celda")
        tableContactos.delegate = self
        tableContactos.dataSource = self
        // Do any additional setup after loading the view.
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableContactos.dequeueReusableCell(withIdentifier: "celda", for: indexPath) as! ContactoTableViewCell
        celda.lblname.text = "Testeando"
        celda.lblPhone.text = "987987897"
        
        
        return celda
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableContactos.deselectRow(at: indexPath, animated: true)
        //paisAMandar = paisesTabla[indexPath.row]
        enviandoNombre = "testing"
        
        performSegue(withIdentifier: "enviarDatos", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "enviarDatos"{
            let objDestino = segue.destination as! EditarContactoViewController
            objDestino.recibirNombre = enviandoNombre
            
        }
    }

}

