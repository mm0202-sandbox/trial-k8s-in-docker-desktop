  pod_name=$(kubectl get pods --namespace default -l "app.kubernetes.io/name=sample,app.kubernetes.io/instance=sample" -o jsonpath="{.items[0].metadata.name}")
  echo "Visit http://127.0.0.1:8080 to use your application"
  kubectl --namespace default port-forward $pod_name 8080:80