# 个人自用Neovim配置

当前配置以 **LazyVim** 为基础，然后添加个人自定义的一些配置

- Github 地址：[LazyVim](https://github.com/LazyVim/LazyVim).
- 官网文档地址：[LazyVim](https://www.lazyvim.org/).

- 添加Dap调试插件

1. 创建日志文件

根据个人情况
/Users/diviner/.local/share/nvim/dap_vscode_js.log

```bash
cd /Users/diviner/.local/share/nvim/lazy
git clone https://github.com/microsoft/vscode-js-debug
cd vscode-js-debug
npm install --legacy-peer-deps
npx gulp vsDebugServerBundle
mv dist out
```
