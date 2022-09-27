FROM node:14 AS build

WORKDIR /app

COPY ./dist ./dist

FROM nginx

WORKDIR /usr/share/nginx/html

RUN rm -rf ./*

COPY --from=build /app/dist .

# kubectl get nodes

# kubectl get pods -n kube-system

# kubectl apply -f https://raw.githubusercontent.com/kubernetes/dashboard/master/aio/deploy/recommended.yaml

# 开启本机访问代理，默认监听 8001 端口
# kubectl proxy

# 创建 ServiceAccount kubernetes-dashboard-admin 并绑定集群管理员权限
# kubectl apply -f dashboard-admin.yml

# 获取登陆 token
# kubectl -n kubernetes-dashboard create token admin-user

# 清空账号
# kubectl -n kubernetes-dashboard delete serviceaccount admin-user
# kubectl -n kubernetes-dashboard delete clusterrolebinding admin-user
