//
//  ViewController.swift
//  snapkitTest
//
//  Created by Burak Yılmaz on 14.03.2020.
//  Copyright © 2020 Burak Yılmaz. All rights reserved.
//

import UIKit
import WebKit
import SnapKit

class HomePageViewController: UIViewController ,UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource,AddContactDelegate {
    func addContact(members: Members) {
        people[0].members.append(members)
    }
    var people = [HipoJson]()
    let cellId = "cell"
    var mainView = UIView()
    var membersView = MembersView()
    var membersSortView = MembersSortView()
    
    override func viewWillAppear(_ animated: Bool) {
        self.newCollection.reloadData()
        self.newCollection.collectionViewLayout.invalidateLayout()
        self.newCollection.layoutSubviews()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NewMemberViewController.delegate = self
        people = membersView.loadJson(filename: "hipo")
        setupMainView()
        sunSnapKitAuthLayout()
        setupRemainingNavItems()
        newCollection.register(CustomeCell.self, forCellWithReuseIdentifier: cellId)
        setupDelegate()
        self.view.addSubview(newCollection)
        setupCollection()
        addNewMemberBttnLayout()
        sortMembersBttnLayout()
        newCollection.reloadData()
    }
    
    let addNewMemberBttn : UIButton = {
        let addNewMemberButton = UIButton()
        addNewMemberButton.setTitle("ADD NEW MEMBERS",for: .normal)
        addNewMemberButton.tintColor = UIColor.blue
        addNewMemberButton.backgroundColor = UIColor(red:0.18, green:0.73, blue:0.31, alpha:1.00)
        addNewMemberButton.layer.cornerRadius = 20
        addNewMemberButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return addNewMemberButton
    }()
    @objc func buttonAction(sender: UIButton!) {
        let newMemberVC = NewMemberViewController()
        navigationController?.pushViewController(newMemberVC, animated: true)
    }
    func addNewMemberBttnLayout(){
        self.view.addSubview(addNewMemberBttn)
        addNewMemberBttn.snp.makeConstraints { (make) in
            make.bottom.trailing.equalTo(view).offset(-40)
            make.height.equalTo(50)
            make.leading.equalTo(view).offset(40)
        }
    }
    
    let sortMembersBttn : UIButton = {
        let sortMembersButton = UIButton()
        sortMembersButton.setTitle("SORT MEMBERS",for: .normal)
        sortMembersButton.tintColor = UIColor.blue
        sortMembersButton.backgroundColor = UIColor(red:0.17, green:0.19, blue:0.22, alpha:1.00)
        sortMembersButton.layer.cornerRadius = 20
        sortMembersButton.addTarget(self, action: #selector(sortAction), for: .touchUpInside)
        return sortMembersButton
    }()
    
    @objc func sortAction(sender: UIButton!) {
        people = membersSortView.sort(members: people, character: "a")
        self.newCollection.performBatchUpdates({
            let indexSet = IndexSet(integersIn: 0...0)
            self.newCollection.reloadSections(indexSet)
        }, completion: nil)
    }
    
    func sortMembersBttnLayout(){
        self.view.addSubview(sortMembersBttn)
        sortMembersBttn.snp.makeConstraints { (make) in
            make.trailing.equalTo(view).offset(-40)
            make.leading.equalTo(view).offset(40)
            make.bottom.equalTo(addNewMemberBttn.snp.top).offset(-20)
            make.height.equalTo(50)
        }
    }
    
    
    private func setupMainView(){
        self.view.addSubview(mainView)
        mainView.backgroundColor = UIColor.darkGray
    }
    private func sunSnapKitAuthLayout(){
        mainView.snp.makeConstraints{ (make) in
            make.top.leading.equalTo(view).offset(0)
            make.trailing.equalTo(view).offset(-0)
            make.bottom.equalTo(view).offset(-0)
        }
    }
    
    
    //TODO:NavigationBar titleImageView
    private func setupRemainingNavItems(){
        let titleImage = UIImage(named: "asd")
        let titleImageView = UIImageView(image: titleImage)
        self.navigationItem.titleView = titleImageView
        
        let bannerWidth = navigationController?.navigationBar.frame.size.width
        let bannerHeight = navigationController?.navigationBar.frame.size.height
        
        let bannerX = bannerWidth! / 2 - (titleImage?.size.width)! / 2
        let bannerY = bannerHeight! / 2 - (titleImage?.size.height)! / 2
        
        titleImageView.frame = CGRect(x: bannerX, y: bannerY, width: bannerWidth!, height: bannerHeight!)
        titleImageView.contentMode = .scaleAspectFit
        
        //TODO:NavigationBar Setup
        navigationController?.navigationBar.barTintColor = UIColor.darkGray
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor(red:0.89, green:0.11, blue:0.22, alpha:1.00)
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor(red:0.89, green:0.11, blue:0.22, alpha:1.00)]
        navigationController?.navigationBar.shadowImage = UIImage()
    }
    
    let newCollection : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        layout.scrollDirection = .vertical
        collection.backgroundColor = UIColor.darkGray
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.isScrollEnabled = true
        collection.showsVerticalScrollIndicator = false
        return collection
    }()
    
    func setupCollection(){
        newCollection.snp.makeConstraints { (make) in
            make.top.leading.equalTo(mainView).offset(0)
            make.trailing.equalTo(mainView).offset(-0)
            make.bottom.equalTo(mainView).offset(-200)
        }
    }
    func setupDelegate(){
        newCollection.delegate = self
        newCollection.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return people[0].members.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newCollection.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! CustomeCell
        cell.backgroundColor = UIColor.lightGray
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.lightGray.cgColor
        cell.layer.cornerRadius = 20
        cell.memberName.text = people[0].members[indexPath.row].name
        cell.memberNameFirstLetter.text = firstLetterName(a: people[0].members[indexPath.row].name!)
        cell.memberGithub.text = "@" + people[0].members[indexPath.row].github!
        cell.memberLocation.text = people[0].members[indexPath.row].location
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width - 6
        return CGSize(width: width, height: 115)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 3, left: 3, bottom: 3, right: 3)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let newVC = EditMemberViewContoller()
        newVC.membersDetail = people
        newVC.index = indexPath.row
        navigationController?.pushViewController(newVC, animated: true)
    }
}


class CustomeCell : UICollectionViewCell{
    override init(frame: CGRect) {
        super.init(frame:frame)
        imageViewConstraints()
        memberNameFirstLetterConstraints()
        memberNameConstraints()
        memberGithubConstraints()
        memberLocationConstraints()
        allowRightImageViewConstraints()
    }
    
    let imageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.layer.cornerRadius = 40
        image.backgroundColor = UIColor.lightGray
        image.clipsToBounds = true
        image.layer.borderWidth = 1.0
        image.layer.borderColor = UIColor(red:0.89, green:0.11, blue:0.22, alpha:1.00).cgColor
        return image
    }()
    func imageViewConstraints(){
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.leading.equalToSuperview().offset(15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(80)
        }
    }
    
    let allowRightImageView : UIImageView = {
        let alloRightImage = UIImageView()
        alloRightImage.translatesAutoresizingMaskIntoConstraints = false
        alloRightImage.contentMode = .scaleAspectFit
        alloRightImage.clipsToBounds = true
        alloRightImage.image = UIImage(named: "down-right-50")
        return alloRightImage
    }()
    func allowRightImageViewConstraints(){
        addSubview(allowRightImageView)
        allowRightImageView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().offset(-15)
            make.centerY.equalToSuperview()
            make.height.width.equalTo(20)
        }
    }
    
    let memberNameFirstLetter : UILabel = {
        let memberNameFirstLetterLabel = UILabel()
        return memberNameFirstLetterLabel
    }()
    func memberNameFirstLetterConstraints(){
        imageView.addSubview(memberNameFirstLetter)
        memberNameFirstLetter.snp.makeConstraints { (make) in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
    }
    
    let memberName : UILabel = {
        let memberNameLabel = UILabel()
        memberNameLabel.textColor = UIColor.black
        return memberNameLabel
    }()
    func memberNameConstraints(){
        self.contentView.addSubview(memberName)
        memberName.snp.makeConstraints { (make) in
            make.leading.equalTo(self.imageView).offset(90)
            make.top.equalTo(self.contentView).offset(0)
            make.trailing.equalTo(self.contentView).offset(0)
            make.height.equalTo(40)
        }
    }
    
    let memberGithub : UILabel = {
        let memberGithubLabel = UILabel()
        memberGithubLabel.textColor = UIColor.black
        return memberGithubLabel
    }()
    func memberGithubConstraints(){
        self.contentView.addSubview(memberGithub)
        memberGithub.snp.makeConstraints { (make) in
            make.leading.equalTo(self.imageView).offset(90)
            make.top.equalTo(memberName.snp.bottom).offset(0)
            make.trailing.equalTo(self.contentView).offset(0)
            make.height.equalTo(40)
        }
    }
    
    let memberLocation : UILabel = {
        let memberLocationLabel = UILabel()
        memberLocationLabel.textColor = UIColor.black
        return memberLocationLabel
    }()
    func memberLocationConstraints(){
        self.contentView.addSubview(memberLocation)
        memberLocation.snp.makeConstraints { (make) in
            make.leading.equalTo(self.imageView).offset(90)
            make.top.equalTo(memberGithub.snp.bottom).offset(0)
            make.trailing.equalTo(self.contentView).offset(0)
            make.height.equalTo(40)
        }
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

