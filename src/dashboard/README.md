## kubernetes-dashboard

### install

by recommended.yaml

[kubernetes/dashboard#getting-started](https://github.com/kubernetes/dashboard#getting-started)

by helm

[helm/kubernetes-dashboard](https://artifacthub.io/packages/helm/k8s-dashboard/kubernetes-dashboard)

以下、helmチャート利用

```shell
helm install kubernetes-dashboard kubernetes-dashboard/kubernetes-dashboard -f values.yaml
```

ホストマシンからのアクセス用に、`values.yaml`でポート公開用のservice設定

### creating sample user

ログインユーザの作成。

以下を参考に作成。

[Creating sample user](https://github.com/kubernetes/dashboard/blob/master/docs/user/access-control/creating-sample-user.md)

```
kubectl apply -f user/dashboard-adminuser.yaml
```

トークン取得

```shell
kubectl get secret $(kubectl get sa/admin-user -o jsonpath="{.secrets[0].name}") -o go-template="{{.data.token | base64decode}}"
```

ここで使用したnamespaceがdefaultのため、参考ページのコマンドからnamespace指定を削除しています。

### ログイン

[https://localhost:30080/#/login](https://localhost:30080/#/login)にアクセス。

トークンのラジオボタンを選択して、入力欄に取得したトークンを入力。

サインインをクリック。
