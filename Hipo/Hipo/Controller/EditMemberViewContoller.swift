//
//  SecondViewController.swift
//  snapkitTest
//
//  Created by Burak Yılmaz on 15.03.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import UIKit
import SnapKit

class EditMemberViewContoller: UIViewController {
    
    var index : Int = 0
    
    var membersDetail = [HipoJson]()
    
    var mainView = UIView()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationItem.title = "Member Details"
        mainView.backgroundColor = UIColor.darkGray
        self.view.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.top.equalTo(view).offset(0)
            make.bottom.equalTo(view).offset(-0)
            make.leading.equalTo(view).offset(0)
            make.trailing.equalTo(view).offset(-0)
        }
        self.mainView.addSubview(nameTF)
        self.mainView.addSubview(githubTF)
        self.mainView.addSubview(ageTF)
        self.mainView.addSubview(locationTF)
        self.mainView.addSubview(positionTF)
        self.mainView.addSubview(yearTF)
        self.mainView.addSubview(githubOpenURLBttn)
        
        nameTFConstraints()
        githubTFConstraints()
        ageTFTFConstraints()
        locationTFConstraints()
        positionTFConstraints()
        yearTFConstraints()
        githubOpenURLBttnConstraints()
        
        members()
    }
    let nameTF : UITextField = {
        let nameTF = UITextField()
        nameTF.isUserInteractionEnabled = false
        nameTF.setLeftImageEM(imageName: UIImage(named: "text")!)
        nameTF.underlinedEM()
        return nameTF
    }()
    private func nameTFConstraints(){
        nameTF.snp.makeConstraints { (make) in
            make.top.equalTo(mainView).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(60)
        }
    }
    
    let githubTF : UITextField = {
        let githubTF = UITextField()
        githubTF.isUserInteractionEnabled = false
        githubTF.setLeftImageEM(imageName: UIImage(named: "github")!)
        githubTF.underlinedEM()
        return githubTF
    }()
    private func githubTFConstraints(){
        githubTF.snp.makeConstraints { (make) in
            make.top.equalTo(nameTF.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(60)
        }
    }
    let githubOpenURLBttn : UIButton = {
        let githubOpenURLBttn = UIButton()
        
        githubOpenURLBttn.rightImage(image: UIImage(named: "down-right-50")!, renderMode: .alwaysOriginal)
        githubOpenURLBttn.addTarget(self, action: #selector(sortAction), for: .touchUpInside)
        return githubOpenURLBttn
    }()
    @objc func sortAction(sender: UIButton!) {
        if let requestUrl = NSURL(string: "https://github.com/" + membersDetail[0].members[index].github) {
            UIApplication.shared.open(requestUrl as URL)
        }
    }
    private func githubOpenURLBttnConstraints(){
        githubOpenURLBttn.snp.makeConstraints { (make) in
            make.top.equalTo(githubTF).offset(0)
            make.bottom.equalTo(githubTF).offset(0)
            make.leading.equalTo(githubTF).offset(0)
            make.trailing.equalTo(githubTF).offset(0)
        }
    }
    
    let ageTF : UITextField = {
        let ageTF = UITextField()
        ageTF.isUserInteractionEnabled = false
        ageTF.keyboardType = .numberPad
        ageTF.setLeftImageEM(imageName: UIImage(named: "age")!)
        ageTF.underlinedEM()
        return ageTF
    }()
    private func ageTFTFConstraints(){
        ageTF.snp.makeConstraints { (make) in
            make.top.equalTo(githubTF.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(60)
        }
    }
    
    let locationTF : UITextField = {
        let locationTF = UITextField()
        locationTF.isUserInteractionEnabled = false
        locationTF.setLeftImageEM(imageName: UIImage(named: "location")!)
        locationTF.underlinedEM()
        return locationTF
    }()
    private func locationTFConstraints(){
        locationTF.snp.makeConstraints { (make) in
            make.top.equalTo(ageTF.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(60)
        }
    }
    
    let positionTF : UITextField = {
        let positionTF = UITextField()
        positionTF.isUserInteractionEnabled = false
        positionTF.setLeftImageEM(imageName: UIImage(named: "job")!)
        positionTF.underlinedEM()
        return positionTF
    }()
    private func positionTFConstraints(){
        positionTF.snp.makeConstraints { (make) in
            make.top.equalTo(locationTF.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(60)
        }
    }
    
    let yearTF : UITextField = {
        let yearTF = UITextField()
        yearTF.isUserInteractionEnabled = false
        yearTF.keyboardType = .numberPad
        yearTF.setLeftImageEM(imageName: UIImage(named: "hipoBlack")!)
        yearTF.underlinedEM()
        yearTF.text = "burak"
        return yearTF
    }()
    private func yearTFConstraints(){
        yearTF.snp.makeConstraints { (make) in
            make.top.equalTo(positionTF.snp.bottom).offset(10)
            make.leading.equalTo(mainView).offset(20)
            make.trailing.equalTo(mainView).offset(-20)
            make.height.equalTo(60)
        }
    }
    
    func members(){
        nameTF.text = membersDetail[0].members[index].name
        githubTF.text = "@" + membersDetail[0].members[index].github
        ageTF.text = String(membersDetail[0].members[index].age)
        locationTF.text = membersDetail[0].members[index].location
        positionTF.text = membersDetail[0].members[index].hipo.position
        yearTF.text = String(membersDetail[0].members[index].hipo.years_in_hipo)
    }
    
}

