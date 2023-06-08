# 使用基础镜像
FROM nginx:latest
COPY ./start.sh /start.sh
# 安装所需的软件包
RUN apt-get update && apt-get install -y curl lsb-release gnupg ca-certificates

# 添加 Cloudflare Warp 的 GPG 公钥
RUN curl https://pkg.cloudflareclient.com/pubkey.gpg | gpg --yes --dearmor --output /usr/share/keyrings/cloudflare-warp-archive-keyring.gpg

# 添加 Cloudflare Warp 的 APT 源
RUN echo "deb [arch=amd64 signed-by=/usr/share/keyrings/cloudflare-warp-archive-keyring.gpg] https://pkg.cloudflareclient.com/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/cloudflare-client.list

# 更新 APT 软件包索引
RUN apt-get update

# 安装 Cloudflare Warp
RUN apt-get install -y cloudflare-warp
EXPOSE 40000
EXPOSE 443
EXPOSE 80
# 启动 Cloudflare Warp 服务
# RUN warp-svc &
# RUN sleep 60
# RUN warp-cli register
# RUN warp-cli set-mode proxy
# RUN warp-cli connect
CMD ["bash", "/start.sh"]