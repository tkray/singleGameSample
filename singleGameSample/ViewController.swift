// 参考URL：http://qiita.com/soymsk/items/17ea8c6dc7349a81873b

import UIKit
import SpriteKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let skView = self.view as! SKView
        skView.showsFPS = true // FPS表示
        skView.showsNodeCount = true //画面内要素数表示
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override func viewWillAppear(animated: Bool) {
        let skView = self.view as! SKView
        // 画面サイズと同じ大きさのscene作成
        let scene = GameScene(size: skView.bounds.size) // ストーリーボードでviewのクラスをSKViewに設定しているので、SKViewのインスタンスとして取得できる
        skView.presentScene(scene) // SKView上にsceneを設定
    }

}

