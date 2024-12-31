<div align="center">

# LightPicture-Docker

_✨ 轻量图床 Docker 镜像 ✨_

</div>

### 简介

基于 [osuuu/LightPicture](https://github.com/osuuu/LightPicture) 构建 Docker 镜像

### 许可证

请参考 [源仓库的许可证](https://github.com/osuuu/LightPicture)

## 踩坑

+ 数据库名不能含有中文
+ 修改表前缀要改完整
+ 密码必须是 6-12位 的数字字母组合（不含12位）

### 直接使用

```bash
docker pull ccr.ccs.tencentyun.com/misaka-public/light-picture:latest
```

```bash
docker run --name LightPicture -p 80:80 ccr.ccs.tencentyun.com/misaka-public/light-picture
```

```docker-compose
services:
    app:
        image: 'ccr.ccs.tencentyun.com/misaka-public/light-picture'
        container_name: LightPicture
        ports:
            - '80:80'
        restart: unless-stopped
        networks:
            - persist 

networks:
    persist:
        external: true
        name: network
```

### 其他说明

由于我通常使用 Caddy 作为反向代理服务器，每个应用独立部署在 Docker 容器里，所以我在此镜像里单独跑了个 Nginx

即：用户 -> Caddy -> Nginx -> PHP，介意勿用~