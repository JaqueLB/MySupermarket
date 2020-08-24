//
//  AddItemViewController.swift
//  SuperM
//
//  Created by Jaque on 29/06/20.
//  Copyright © 2020 Jaqueline Lemes Botaro. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {
    var viewModel: HomeViewModel
    var groceryItem: GroceryItem?
    var itemIndex: Int?
    var saveButton: UIButton = {
        var button = UIButton()
        button.setTitle("Save", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.addTarget(self, action: #selector(save), for: .touchUpInside)
        return button
    }()
    lazy var listNameTextField: UITextField = {
        var textField = UITextField()
        textField.borderStyle = .roundedRect
        // define where caret goes
        textField.becomeFirstResponder()
        return textField
    }()
    init(viewModel: HomeViewModel, groceryItem: GroceryItem?, itemIndex: Int?) {
        self.viewModel = viewModel
        self.groceryItem = groceryItem
        self.itemIndex = itemIndex
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUi()
        dismissKeyboard()
        if let item = groceryItem {
            listNameTextField.text = item.title
        }
    }
    
    @objc func save() {
        // $text = !empty(listnametextfield.text) ? listnametexfield.text : ""; continue;
        guard let text = listNameTextField.text, !text.isEmpty else { return }

        if (viewModel.isEditing) {
            guard let index = itemIndex else {return}
            viewModel.edit(index: index, newItem: GroceryItem(id: UUID(), title: text))
        } else {
            viewModel.add(item: GroceryItem(id: UUID(), title: text))
        }
        dismiss(animated: true, completion: nil)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
    
    func dismissKeyboard() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func setupUi() {
        view.backgroundColor = .systemBackground
        view.addSubview(saveButton)
        view.addSubview(listNameTextField)
        
        // ao abrir {} estamos identificando cada elemento com $0 e acessando suas propriedades
        view.subviews.forEach({
            $0.translatesAutoresizingMaskIntoConstraints = false
        })
        
        NSLayoutConstraint.activate([
            listNameTextField.bottomAnchor.constraint(equalTo: saveButton.topAnchor),
            listNameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -8),
            listNameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 8),
            saveButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            saveButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
}

// delegate: goes with protocols, come from core. Protocol is kind of an interface in PHP. Delegates are abstract functions.
extension AddItemViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
