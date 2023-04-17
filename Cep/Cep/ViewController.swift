//
//  ViewController.swift
//  Cep
//
//  Created by Pedro Henrique on 30/03/23.
//

import UIKit
import Foundation

class ViewController: UIViewController {

    
    @IBOutlet weak var tfCep: UITextField!
    @IBOutlet weak var lbLogradouro: UILabel!
    @IBOutlet weak var lbLocalidade: UILabel!
    @IBOutlet weak var lbBairro: UILabel!
    @IBOutlet weak var lbDdd: UILabel!
    @IBOutlet weak var btImages: UIButton!
    
 
    
    var cep: Cep!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func viewWillAppear(_ animated: Bool) {
        btImages.isEnabled = false
        btImages.backgroundColor = .gray
        
    }
    

    @IBAction func search(_ sender: UIButton) {
        guard let tfcep = tfCep.text else {return}
        ApiCep.searchCEP(tfcep) { (cep) in
            DispatchQueue.main.sync {
                self.cep = cep
                self.lbLogradouro.text = "Logradouro: \(cep.logradouro)"
                self.lbLocalidade.text = "Localidade: \(cep.localidade)/\(cep.uf)"
                self.lbBairro.text = "Bairro: \(cep.bairro)"
                self.lbDdd.text = "DDD: \(cep.ddd)"
                self.view.endEditing(true)
                
                
               
                
            }
        }
        btImages.isEnabled = true
        btImages.backgroundColor = .systemBlue
        
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! ImagesViewController
        vc.cep = cep
        
    }
   
}



