
import UIKit
import SnapKit

class SigninController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // bg img
        let bgImgView = UIImageView(image: UIImage(named: signinBgImg))

        view.addSubview(bgImgView)
        view.sendSubviewToBack(bgImgView)
        bgImgView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }

        // title
        let title = UILabel()
        title.text = "米奇公园"
        title.textColor = UIColor.whiteColor()
        title.font = UIFont.systemFontOfSize(30)

        view.addSubview(title)
        title.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(view)
            make.top.equalTo(95)
            make.height.equalTo(30)
        }

        // name label
        let name = UILabel()
        name.text = "用户名"
        name.textColor = UIColor.whiteColor()
        name.font = UIFont.systemFontOfSize(17)

        view.addSubview(name)
        name.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.top.equalTo(210)
        }
        // name input
        let nameInput = UITextField()
        nameInput.placeholder = "请输入用户名"
        nameInput.font = UIFont.systemFontOfSize(19)
        nameInput.textColor = UIColor.whiteColor()
        nameInput.autocorrectionType = UITextAutocorrectionType.No
        nameInput.autocapitalizationType = UITextAutocapitalizationType.None

        view.addSubview(nameInput)
        nameInput.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.right.equalTo(-42)
            make.top.equalTo(236)
        }

        // name border
        let nameBorder = UIView()
        nameBorder.backgroundColor = UIColor.whiteColor()

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
        pass.textColor = UIColor.whiteColor()
        pass.font = UIFont.systemFontOfSize(17)

        view.addSubview(pass)
        pass.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.top.equalTo(290)
        }
        // pass input
        let passInput = UITextField()
        passInput.placeholder = "请输入密码"
        passInput.secureTextEntry = true
        passInput.font = UIFont.systemFontOfSize(19)
        passInput.textColor = UIColor.whiteColor()

        view.addSubview(passInput)
        passInput.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.right.equalTo(-42)
            make.top.equalTo(316)
        }

        // pass border
        let passBorder = UIView()
        passBorder.backgroundColor = UIColor.whiteColor()

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
        submit.layer.borderColor = UIColor.whiteColor().CGColor
        submit.setTitle("登  录", forState: .Normal)

        view.addSubview(submit)
        submit.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(412)
            make.centerX.equalTo(view)
            make.width.equalTo(240)
            make.height.equalTo(52)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
