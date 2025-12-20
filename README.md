# dotfiles

## 準備
1. NERDFontのダウンロード
    ```
    https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Terminus
    ```

    settings NERDFont to WSL
    [!test](docs/pics/wsl.png)

1. ripgrepのインストール
    ```
    sudo dnf install epel-release -y
    sudo dnf update -y
    sudo dnf install ripgrep -y
    ```



## 初回起動時
1. `Copilot auth`を実行し、GitHub Copilotの認証を行う (`Copilot stasus`で認証状態を確認可能)
2. `TSInstall <language>`
    - python
    - bash
    - lua
    - json
    - yaml
    - java
    - javascript
    - go
