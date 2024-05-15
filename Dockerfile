# 使用官方的 Node.js 镜像作为基础镜像
FROM node:14-alpine as build

# 设置工作目录
WORKDIR /app

# 将 package.json 和 package-lock.json 拷贝到工作目录
COPY package*.json ./

# 安装依赖
RUN npm install

# 拷贝所有文件到工作目录
COPY . .

# 构建应用
RUN npm run build

# 使用 Nginx 镜像作为基础镜像来运行 React 应用
FROM nginx:alpine

# 将构建好的 React 应用文件拷贝到 Nginx 默认的静态文件目录
COPY --from=build /app/build /usr/share/nginx/html

# 暴露 80 端口
EXPOSE 80

# 启动 Nginx 服务
CMD ["nginx", "-g", "daemon off;"]
