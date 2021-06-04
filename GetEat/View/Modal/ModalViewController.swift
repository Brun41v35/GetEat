//
//  ModalViewController.swift
//  GetEat
//
//  Created by Bruno Silva on 04/06/21.
//

import UIKit

class ModalViewController: UIViewController {
    
    //MARK: - Outlets
    @IBOutlet weak var modalView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bodyLabel: UILabel!
    @IBOutlet weak var modalButton: UIButton!
    
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    //MARK: - Setup
    private func setup() {
        setupView()
        setupModal()
        buttonModal()
    }
    
    private func setupModal() {
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
    }
    
    private func setupView() {
        modalView.layer.cornerRadius = 10
    }
    
    //MARK: - Functions
    private func buttonModal() {
        modalButton.addTarget(self, action: #selector(dismissModal), for: .touchUpInside)
    }
    
    //MARK: - Actions
    @objc private func dismissModal() {
        dismiss(animated: true, completion: nil)
    }
}
