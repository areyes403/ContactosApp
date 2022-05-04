//
//  EditarContactoViewController.swift
//  Contactos
//
//  Created by mac17 on 03/05/22.
//

import UIKit

class EditarContactoViewController: UIViewController {

    @IBOutlet weak var imgContacto: UIImageView!
    @IBOutlet weak var lblNombre: UILabel!
    var recibirNombre=""
    override func viewDidLoad() {
        super.viewDidLoad()
        lblNombre.text = recibirNombre

        //agregar la gestura a la imagen
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(clickImagen))
        gestureRecognizer.numberOfTouchesRequired = 1
        gestureRecognizer.numberOfTapsRequired = 1
        imgContacto.addGestureRecognizer(gestureRecognizer)
        imgContacto.isUserInteractionEnabled = true
        // Do any additional setup after loading the view.
    }
    
    @objc func clickImagen(gesture: UITapGestureRecognizer){
        print("cambiar Imagen")
        
        let vs = UIImagePickerController()
        vs.sourceType = .photoLibrary
        vs.delegate = self
        vs.allowsEditing = true
        present(vs, animated: true)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension EditarContactoViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imagenSeleccionada = info[UIImagePickerController.InfoKey(rawValue: "UIImagePickerControllerEditedImage")] as? UIImage{
            imgContacto.image = imagenSeleccionada
        }
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
