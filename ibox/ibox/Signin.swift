
import UIKit
import SnapKit

class SigninController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // bg img
        let bgImgView = UIImageView(image: UIImage(named: signinBgImg))

        view.addSubview(bgImgView)
        view.sendSubview(toBack: bgImgView)
        bgImgView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }

        // title
        let title = UILabel()
        title.text = "米奇公园"
        title.textColor = UIColor.white()
        title.font = UIFont.systemFont(ofSize: 30)

        view.addSubview(title)
        title.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(95)
            make.height.equalTo(30)
        }

        // name label
        let name = UILabel()
        name.text = "用户名"
        name.textColor = UIColor.white()
        name.font = UIFont.systemFont(ofSize: 17)

        view.addSubview(name)
        name.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.top.equalTo(210)
        }
        // name input
        let nameInput = UITextField()
        nameInput.placeholder = "请输入用户名"
        nameInput.font = UIFont.systemFont(ofSize: 19)
        nameInput.textColor = UIColor.white()
        nameInput.autocorrectionType = UITextAutocorrectionType.no
        nameInput.autocapitalizationType = UITextAutocapitalizationType.none

        view.addSubview(nameInput)
        nameInput.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.right.equalTo(-42)
            make.top.equalTo(236)
        }

        // name border
        let nameBorder = UIView()
        nameBorder.backgroundColor = UIColor.white()

        view.addSubview(nameBorder)
        nameBorder.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.right.equalTo(-42)
            make.top.equalTo(260)
            make.height.equalTo(2)
        }

        // pass label
        let pass = UILabel()
        pass.text = "密码"
        pass.textColor = UIColor.white()
        pass.font = UIFont.systemFont(ofSize: 17)

        view.addSubview(pass)
        pass.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.top.equalTo(290)
        }
        // pass input
        let passInput = UITextField()
        passInput.placeholder = "请输入密码"
        passInput.isSecureTextEntry = true
        passInput.font = UIFont.systemFont(ofSize: 19)
        passInput.textColor = UIColor.white()

        view.addSubview(passInput)
        passInput.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.right.equalTo(-42)
            make.top.equalTo(316)
        }

        // pass border
        let passBorder = UIView()
        passBorder.backgroundColor = UIColor.white()

        view.addSubview(passBorder)
        passBorder.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.right.equalTo(-42)
            make.top.equalTo(340)
            make.height.equalTo(2)
        }

        // submit
        let submit = UIButton()
        submit.layer.cornerRadius = 26
        submit.layer.borderWidth = 2
        submit.layer.borderColor = UIColor.white().cgColor
        submit.setTitle("登  录", for: UIControlState())

        view.addSubview(submit)
        submit.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(412)
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(52)
        }

        submit.addTarget(self, action: #selector(SigninController.clickSignin(_:)), for: .touchUpInside)
    }

    // submit
    func clickSignin(_ sender: UIButton!) {
        let mAuthList = MAuthListController()
        navigationController?.pushViewController(mAuthList, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
