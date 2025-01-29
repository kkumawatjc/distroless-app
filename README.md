
1. Build image - `docker build -t kkumawatjc/distroless-app .`
2. push image - `docker push kkumawatjc/distroless-app`
3. deploy - `kubectl apply -f kubernetes/deployment.yaml`
