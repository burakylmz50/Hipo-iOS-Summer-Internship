//
//  NewMemberViewController.swift
//  snapkitTest
//
//  Created by Burak Yılmaz on 16.03.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import UIKit
import SnapKit
protocol AddContactDelegate{
    func addContact(members :Members)
}

class NewMemberViewController: UIViewController,UITextFieldDelegate {
    static var delegate : AddContactDelegate!
    let mainView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollScreen()
        mainView.backgroundColor = UIColor.darkGray
        self.navigationItem.title = "Add New Members"
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.top.bottom.leading.trailing.equalTo(view).offset(0)
        }
        self.view.addSubview(selectTeamBttn)
        self.mainView.addSubview(imageView22)
        self.mainView.addSubview(nameTF)
        self.mainView.addSubview(githubTF)
        self.mainView.addSubview(ageTF)
        self.mainView.addSubview(locationTF)
        self.mainView.addSubview(positionTF)
        self.mainView.addSubview(yearTF)
        self.mainView.addSubview(createBttn)
        
        selectTeamBttnConstraints()
        imageView22Constraints()
        nameTFConstraints()
        githubTFConstraints()
        ageTFTFConstraints()
        locationTFConstraints()
        positionTFConstraints()
        yearTFConstraints()
        createBttnConstraints()
    }
    
    let imageView22 : UIImageView = {
        let imageView22 = UIImageView()
        imageView22.translatesAutoresizingMaskIntoConstraints = false
        imageView22.contentMode = .scaleAspectFit
        imageView22.clipsToBounds = true
        imageView22.image = UIImage(named: "management")
        return imageView22
    }()
    private func imageView22Constraints(){
        imageView22.snp.makeConstraints { (make) in
            make.centerY.equalTo(selectTeamBttn)
            make.leading.equalTo(selectTeamBttn).offset(10)
            make.width.equalTo(20)
            make.height.equalTo(20)
        }
    }
    
    let selectTeamBttn : UIButton = {
        let selectTeam = UIButton()
        selectTeam.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        selectTeam.setTitle("Choose Team", for: .normal)
        selectTeam.buttonSetup()
        return selectTeam
    }()
    private func selectTeamBttnConstraints(){
        selectTeamBttn.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(40)
        }
    }
    
    let nameTF : UITextField = {
        let nameTF = UITextField()
        nameTF.setLeftImage(imageName: UIImage(named: "text")!)
        nameTF.underlined(placeHolder: "Name Surname")
        nameTF.addTarget(self, action: #selector(nameTF.textFieldDidChange), for: .editingChanged)
        return nameTF
    }()
    private func nameTFConstraints(){
        nameTF.snp.makeConstraints { (make) in
            make.top.equalTo(selectTeamBttn.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(40)
        }
    }
    
    let githubTF : UITextField = {
        let githubTF = UITextField()
        githubTF.setLeftImage(imageName: UIImage(named: "github")!)
        githubTF.underlined(placeHolder: "Github Username")
        githubTF.addTarget(self, action: #selector(githubTF.textFieldDidChange), for: .editingChanged)
        return githubTF
    }()
    private func githubTFConstraints(){
        githubTF.snp.makeConstraints { (make) in
            make.top.equalTo(nameTF.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(40)
        }
    }
    
    let ageTF : UITextField = {
        let ageTF = UITextField()
        ageTF.keyboardType = .numberPad
        ageTF.setLeftImage(imageName: UIImage(named: "age")!)
        ageTF.underlined(placeHolder: "Age")
        ageTF.addTarget(self, action: #selector(ageTF.textFieldDidChange), for: .editingChanged)
        return ageTF
    }()
    private func ageTFTFConstraints(){
        ageTF.snp.makeConstraints { (make) in
            make.top.equalTo(githubTF.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(40)
        }
    }
    
    let locationTF : UITextField = {
        let locationTF = UITextField()
        locationTF.setLeftImage(imageName: UIImage(named: "location")!)
        locationTF.underlined(placeHolder: "Location")
        locationTF.addTarget(self, action: #selector(locationTF.textFieldDidChange), for: .editingChanged)
        return locationTF
    }()
    private func locationTFConstraints(){
        locationTF.snp.makeConstraints { (make) in
            make.top.equalTo(ageTF.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(40)
        }
    }
    
    let positionTF : UITextField = {
        let positionTF = UITextField()
        positionTF.setLeftImage(imageName: UIImage(named: "job")!)
        positionTF.underlined(placeHolder: "Position")
        positionTF.addTarget(self, action: #selector(positionTF.textFieldDidChange), for: .editingChanged)
        return positionTF
    }()
    private func positionTFConstraints(){
        positionTF.snp.makeConstraints { (make) in
            make.top.equalTo(locationTF.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(40)
        }
    }
    
    let yearTF : UITextField = {
        let yearTF = UITextField()
        yearTF.keyboardType = .numberPad
        yearTF.setLeftImage(imageName: UIImage(named: "hipoBlack")!)
        yearTF.underlined(placeHolder: "Years in Hipo")
        yearTF.addTarget(self, action: #selector(yearTF.textFieldDidChange), for: .editingChanged)
        return yearTF
    }()
    private func yearTFConstraints(){
        yearTF.snp.makeConstraints { (make) in
            make.top.equalTo(positionTF.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(40)
        }
    }
    
    let createBttn : UIButton = {
        let createBttn = UIButton()
        createBttn.backgroundColor = UIColor(red:0.89, green:0.11, blue:0.22, alpha:1.00)
        createBttn.layer.cornerRadius = 18
        createBttn.setTitleColor(UIColor.white, for: .normal)
        createBttn.titleLabel?.font = .systemFont(ofSize: 18, weight: .regular)
        createBttn.setTitle("Create New Member", for: .normal)
        createBttn.addTarget(self, action: #selector(createButton), for: .touchUpInside)
        return createBttn
    }()
    
    @objc func createButton(sender: UIButton!) {
        if (positionTF.text?.isEmpty == true || yearTF.text?.isEmpty == true || nameTF.text?.isEmpty == true || ageTF.text?.isEmpty == true || locationTF.text?.isEmpty == true || githubTF.text?.isEmpty == true ){
            let alert = UIAlertController(title: "Empty parts", message: "Please fill all required field.Correctly!", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else if(nameTF.text!.numberOfWords < 2){
            let alert = UIAlertController(title: "Error", message: "Missing name or surname", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            let hipo = Hipo(position: positionTF.text, years_in_hipo: Int(yearTF.text!))
            let information = Members(name: nameTF.text!, age: Int(ageTF.text!)!, location: locationTF.text!, github: githubTF.text!, hipo: hipo)
            NewMemberViewController.delegate?.addContact(members: information)
            self.navigationController?.popViewController(animated: true)
        }
    }
    private func createBttnConstraints(){
        createBttn.snp.makeConstraints { (make) in
            make.top.equalTo(yearTF.snp.bottom).offset(30)
            make.centerX.equalTo(mainView)
            make.leading.equalTo(mainView).offset(50)
            make.trailing.equalTo(mainView).offset(-50)
            make.height.equalTo(50)
        }
    }
    
    @objc func buttonAction(sender: UIButton!) {
        let alert = UIAlertController(title: "Choose your team!",
                                      message: nil,
                                      preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "iOS Developer", style: .default, handler: { action in
            self.selectTeamBttn.setTitle("iOS Developer", for: .normal)
            self.actionOnClick()
        }))
        alert.addAction(UIAlertAction(title: "Android Developer", style: .default, handler: { action in
            self.selectTeamBttn.setTitle("Android Developer", for: .normal)
            
        }))
        alert.addAction(UIAlertAction(title: "Backend Developer", style: .default, handler: { action in
            self.selectTeamBttn.setTitle("Backend Developer", for: .normal)
            self.actionOnClick()
        }))
        alert.addAction(UIAlertAction(title: "Hardware", style: .default, handler: { action in
            self.selectTeamBttn.setTitle("Hardware", for: .normal)
            self.actionOnClick()
        }))
        alert.addAction(UIAlertAction(title: "QA Automation", style: .default, handler: { action in
            self.selectTeamBttn.setTitle("QA Automation", for: .normal)
            self.actionOnClick()
        }))
        alert.addAction(UIAlertAction(title: "Backend Developer", style: .default, handler: { action in
            self.selectTeamBttn.setTitle("Backend Developer", for: .normal)
            self.actionOnClick()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { action in }))
        self.present(alert, animated: true)
    }
    
    func actionOnClick(){
        self.selectTeamBttn.setTitleColor(UIColor.black, for: .normal)
        self.selectTeamBttn.titleLabel?.font = .systemFont(ofSize: 20, weight: .regular)
    }
    private func delegateTF(){
        nameTF.delegate = self
        githubTF.delegate = self
        ageTF.delegate = self
        locationTF.delegate = self
        positionTF.delegate = self
        yearTF.delegate = self
    }
    
    // MARK : Dismiss Keyboard(TextField)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTF.resignFirstResponder()
        githubTF.resignFirstResponder()
        ageTF.resignFirstResponder()
        locationTF.resignFirstResponder()
        positionTF.resignFirstResponder()
        yearTF.resignFirstResponder()
        return true;
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    private func scrollScreen(){
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow),
                                               name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide),
                                               name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    // MARK : Scrolling the screen when the keyboard is opened
    @objc func keyboardWillShow(notification: NSNotification) {
        var translation:CGFloat = 0
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if yearTF.isEditing{
                translation = CGFloat(-keyboardSize.height/2)
            }else if yearTF.isEditing{
                translation = CGFloat(-keyboardSize.height/2 / 3.8)
            }
        }
        UIView.animate(withDuration: 0.2) {
            self.view.transform = CGAffineTransform(translationX: 0, y: translation)
        }
    }
    @objc func keyboardWillHide(notification: NSNotification) {
        UIView.animate(withDuration: 0.2) {
            self.view.transform = CGAffineTransform(translationX: 0, y: 0)
        }
    }
}
