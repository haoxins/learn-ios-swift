
import UIKit
import SnapKit

class SigninController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // bg img
        let bgImgView = UIImageView(image: UIImage(named: signinBgImg))

        view.addSubview(bgImgView)
        bgImgView.snp_makeConstraints { (make) -> Void in
            make.edges.equalTo(view).inset(UIEdgeInsetsMake(0, 0, 0, 0))
        }
        // title
        let title = UILabel()
        title.text = "米奇公园"
        title.textColor = UIColor.whiteColor()
        title.font = UIFont.systemFontOfSize(30)

        bgImgView.addSubview(title)
        title.snp_makeConstraints { (make) -> Void in
            make.centerX.equalTo(bgImgView)
            make.top.equalTo(95)
            make.height.equalTo(30)
        }

        // name
        let name = UILabel()
        name.text = "用户名"
        name.textColor = UIColor.whiteColor()
        name.font = UIFont.systemFontOfSize(17)

        bgImgView.addSubview(name)
        name.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.top.equalTo(210)
        }

        let nameInput = UITextField()
        nameInput.placeholder = "请输入用户名"

        bgImgView.addSubview(nameInput)
        nameInput.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(42)
            make.top.equalTo(236)
        }

        // pass
        let pass = UILabel()
        pass.text = "密码"
        pass.textColor = UIColor.whiteColor()
        pass.font = UIFont.systemFontOfSize(17)

        bgImgView.addSubview(pass)
        pass.snp_makeConstraints { (make) -> Void in
            make.left.equalTo(42)
            make.top.equalTo(290)
        }

        let passInput = UITextField()
        passInput.placeholder = "请输入密码"

        bgImgView.addSubview(passInput)
        passInput.snp_makeConstraints { (make) -> Void in
            make.left.right.equalTo(42)
            make.top.equalTo(316)
        }

        // submit
        let submit = UIButton()
        submit.layer.cornerRadius = 26
        submit.layer.borderWidth = 2
        submit.layer.borderColor = UIColor.whiteColor().CGColor
        submit.setTitle("登  录", forState: .Normal)

        bgImgView.addSubview(submit)
        submit.snp_makeConstraints { (make) -> Void in
            make.top.equalTo(412)
            make.centerX.equalTo(bgImgView)
            make.width.equalTo(240)
            make.height.equalTo(52)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
