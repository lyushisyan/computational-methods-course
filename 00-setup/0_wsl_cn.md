# 安装 WSL 和 Ubuntu

第二讲使用 Windows 中的 Ubuntu 终端。以下步骤适用于 Windows 11，或 Windows 10 版本 2004（内部版本 19041）及以上。可按 `Win + R`，输入 `winver` 查看系统版本。

## 1. 下载并安装

在“开始”菜单搜索 **PowerShell**，右键选择**以管理员身份运行**，执行：

```powershell
wsl --install
```

该命令会安装 WSL 和默认的 Ubuntu，不需要另外下载 Ubuntu ISO 镜像。完成后重启电脑。

如果已经安装了 WSL 和 Ubuntu，直接从第 3 步检查，不必重新安装。如果只有 WSL、没有 Ubuntu，在管理员 PowerShell 中执行：

```powershell
wsl --install -d Ubuntu
```

## 2. 首次启动 Ubuntu

重启后，在“开始”菜单打开 **Ubuntu**，等待初始化完成，然后按提示设置：

- Linux 用户名，例如 `student`；
- 密码，并再次输入确认。

这是 Ubuntu 的账号，可以与 Windows 账号不同。输入密码时屏幕不显示字符或星号，属于正常现象。

看到类似下面的提示符，表示已进入 Ubuntu：

```text
student@DESKTOP:~$
```

## 3. 检查安装

打开一个新的 **Windows PowerShell** 窗口，执行：

```powershell
wsl -l -v
```

列表中应有 `Ubuntu`，其 `VERSION` 应为 `2`。`Stopped` 表示当前没有运行，不代表安装失败。

如果已有的 Ubuntu 显示 `VERSION 1`，可按[微软的版本切换说明](https://learn.microsoft.com/en-us/windows/wsl/basic-commands#set-wsl-version-to-1-or-2)转换为 WSL 2；已有重要数据时先备份。

## 4. 以后如何打开

可以从“开始”菜单打开 **Ubuntu**，也可以在 PowerShell 或 Windows Terminal 的 PowerShell 标签页中执行：

```powershell
wsl -d Ubuntu
```

如果 `wsl -l -v` 显示的名称不是 `Ubuntu`，将命令中的名称换成列表中的实际名称。

进入 Ubuntu 后，可以执行以下 Linux 命令：

```bash
pwd
uname -r
```

离开 Ubuntu、返回 Windows 终端：

```bash
exit
```

## 5. 下载遇到问题

如果安装停在 `0.0%`，在管理员 PowerShell 中尝试：

```powershell
wsl --install --web-download -d Ubuntu
```

如果提示未启用虚拟化，按[微软故障排查说明](https://learn.microsoft.com/en-us/windows/wsl/troubleshooting#installation-issues)检查 BIOS/UEFI 中的虚拟化设置。

Windows 中安装的 Python/Conda 不等于 Ubuntu 中的 Linux 环境。后续 NEP-kappa 实践需要在 Ubuntu 中准备 Linux 版 Conda 环境，再按照[第二讲说明](../02-linux-nepkappa/README.md)操作。

参考：[WSL 安装](https://learn.microsoft.com/en-us/windows/wsl/install)、[首次配置](https://learn.microsoft.com/en-us/windows/wsl/setup/environment)、[常用命令](https://learn.microsoft.com/en-us/windows/wsl/basic-commands)。
