# ISUCON13 素振り

## 初期化

```
ssh-keygen -t ed25519 ssh/id_ed25519
```

できあがった公開鍵をGitHubリポジトリのdeploy keyに登録しておく

### Ansible

hosts.ymlの各サーバーのIPアドレスを書き換える。
その後以下を実行。

```
ansible-playbook -i hosts.yml init.yml
```

全サーバーがmainブランチを向くようになる。

## 更新

```
ansible-playbook -i hosts.yml update.yml
```
