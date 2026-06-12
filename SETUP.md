# 后端部署指南（Netlify + Supabase）

## 前置条件

1. 注册 [Supabase](https://supabase.com) 账号，创建免费项目
2. 注册 [Netlify](https://netlify.com) 账号

## 1. 配置 Supabase 数据库

1. 进入 Supabase 项目 → SQL Editor
2. 复制 `setup.sql` 内容并执行

## 2. 获取 Supabase 凭证

进入 Supabase 项目 → Settings → API：
- `Project URL` → 填入 `index.html` 中的 `SUPABASE_URL`
- `anon public` key → 填入 `index.html` 中的 `SUPABASE_KEY`

## 3. 本地测试

编辑 `index.html`，替换 `SUPABASE_URL` 和 `SUPABASE_KEY` 为真实值，然后直接在浏览器中打开测试。

## 4. 部署到 Netlify

1. 将项目推送到 GitHub
2. 登录 Netlify → New site from Git → 选择仓库
3. 构建设置无需修改（静态站点）
4. 部署后在 Netlify 站点设置中无需额外配置（密钥已硬编码在前端）
5. 访问 Netlify 分配的 URL 即可使用

## 分享链接格式

分享的链接格式为 `https://你的域名/#xxxxxxxx`（8 位短 ID），用户打开链接即自动从 Supabase 加载对应的简历数据。

## 注意事项

- 免费版 Supabase 有 500MB 存储和 50,000 行限制，简历场景完全够用
- 照片（base64）不随分享链接存储，接收方需自行上传
- 旧的 `#` + base64 格式链接仍兼容
