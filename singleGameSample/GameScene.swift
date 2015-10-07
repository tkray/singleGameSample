import SpriteKit

class GameScene : SKScene {
    var initiated: Bool = false
    
    /* sceneがSKView上に表示される度に呼ばれる関数 */
    override func didMoveToView(view: SKView) {
        if ( !initiated ) { //初期化時のみ実行
            self.initContent()
            self.initiated = true
            
            
            // 重力を逆方向にする
            // self.physicsWorld.gravity.dy = 1
        }
    }
    
    // タップされた時に呼ばれる
    // 1.2になってから変更があったので注意
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        let touch = touches.first as! UITouch // タッチオブジェクトの取得
        let location : CGPoint = touch.locationInNode(self) //　タッチ位置の取得（CGPointで）
        
        // 図形の追加
        addShape(location)
    }
    
    func initContent() {
        // 背景色設定
        self.backgroundColor = SKColor.blueColor()
        // テキストノードの作成
        var label = self.newHelloNode()
        // sceneにテキストノードを追加
        self.addChild(label)
    }
    
    // 画面にテキストノードを表示する
    func newHelloNode(Void) -> SKLabelNode {
        var helloNode = SKLabelNode(text: "Hello, World!")
        helloNode.fontColor = UIColor(red: 1.0, green:1.0, blue: 1.0, alpha: 1)
        helloNode.fontSize = 60
        helloNode.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame))
        
        return helloNode
    }
    
    
    // 図形を追加する
    func addShape(location: CGPoint) {
        // 追加する丸ボタンのサイズを設定
        var size = self.frame.width/50.0
        // 追加するシェイプ
        let shape = SKShapeNode(circleOfRadius: size)
        shape.fillColor = UIColor.whiteColor() // 塗りつぶし設定
        shape.position = location //表示位置設定
        
        // 物理演算の追加
        shape.physicsBody = SKPhysicsBody(circleOfRadius: size)
        shape.physicsBody?.dynamic = true // このオブジェクト自体が物理演算によって動くように指定
        
        self.addChild(shape) //画面へのオブジェクト追加
    }
}