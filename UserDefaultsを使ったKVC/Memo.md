# UserDefaults

# 元ネタ
- [1024jp/Preferences\-Demo](https://github.com/1024jp/Preferences-Demo)
- https://speakerdeck.com/1024jp/manners-of-preferences-window-on-macos

>![](https://i.imgur.com/l671v2L.jpg)

# メモ

- `Shared User Defaults Controller`は`shared`を指しているんかなと思う
    - https://developer.apple.com/documentation/appkit/nsuserdefaultscontroller
- `values`も以下だろう
    - https://developer.apple.com/documentation/appkit/nsuserdefaultscontroller/1388176-values

![](https://i.imgur.com/VxnTpbs.jpg)

- 以下で実際にUserDefaultsに保存されていることが確認できる
    - [UserDefaultsの概要と操作方法\(Swift\)](https://qiita.com/uhooi/items/429cac9b798b9c0937ae)

```swift
    @IBAction func checkUserDefaultsButtonClicked(_ sender: Any) {
        guard let message = UserDefaults.standard.string(forKey: "message") else {
            return
        }
        print("DEBUG: \(message)")
    }
```
