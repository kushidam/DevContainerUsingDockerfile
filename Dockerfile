# マルチステージビルドを使用することで、最終的な実行用イメージのサイズを小さくする。
# ビルドステージで必要なパッケージや依存関係を含めた大きなイメージを作成。
# 最終的な実行用イメージではそれらを削除して軽量化。

# Goビルド用のベースイメージを指定します
FROM golang:1.19 AS build

# 作業ディレクトリを設定します
WORKDIR /app

# Goの依存関係をコピーします
COPY go.mod ./
RUN go mod download

# ソースコードをコピーします
COPY . .

# # Goアプリケーションをビルドします
# RUN CGO_ENABLED=0 GOOS=linux go build -o app .

# # 最終的な実行用イメージを作成します
# FROM alpine:latest

# # ビルドしたGoアプリケーションをコンテナにコピーします
# COPY --from=build /app/app .

# # EXPOSE 8080

# # # コンテナ内で実行するコマンドを指定します
# # CMD ["./app"]
