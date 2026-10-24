
本文档提供了三种主流的 Python 环境搭建方式。请根据你的使用需求选择最适合的一种。

## 目录

- [方案 1：官方 Python + pip (轻量/开发用)](#方案-1官方-python--pip)
- [方案 2：Miniconda (平衡/数据分析用)](#方案-2miniconda)
- [方案 3：Anaconda (全家桶/初学者用)](#方案-3anaconda)

## 方案 1：官方 Python + pip

> **适用人群：** 软件工程师、Web 开发者。  
> **特点：** 最纯净，完全自定义，占用空间最小。

#### 1. 安装
1. 访问 [Python 官网下载页](https://www.python.org/downloads/)。
2. 下载并运行安装程序。
3. ⚠️ **关键步骤：** 务必勾选底部的 **"Add Python to PATH"**。
4. 点击 **Install Now**。

#### 2. 配置 (CMD)
打开命令提示符 (CMD)，按顺序执行以下命令：

1. 验证安装
```
python --version
```

2. 创建虚拟环境 (建议每个项目单独创建)
```
python -m venv my_env
```

3. 激活环境，激活成功后命令行前会出现 (my_env)
```
my_env\Scripts\activate
```

4. 更新 pip
```
python -m pip install --upgrade pip
```

5. 安装数据科学常用库
```
pip install numpy scipy matplotlib
```

```
pip install jupyter notebook
```

6. 启动 Jupyter Notebook
```
jupyter notebook
```

## 方案 2：Miniconda

> **适用人群：** 数据分析师、科研人员。  
> **特点：** 包含 Conda 包管理器，体积适中，环境管理强大。

### 1. 安装

1. 访问 [https://docs.conda.io/en/latest/miniconda.html](https://docs.conda.io/en/latest/miniconda.html)
    
2. 下载 Windows 64-bit 安装包并安装（保持默认设置即可）。

### 2. 配置 (Anaconda Prompt)

在“开始”菜单搜索并打开 Anaconda Prompt (不要使用 CMD)，执行以下命令：

1. 创建环境
```
conda create -n numcalc python=3.12
```

2. 激活环境
```
conda activate numcalc
```

3. 安装库
```
conda install numpy scipy matplotlib -y
```

```
conda install jupyter notebook
```

4. 启动 Jupyter Notebook
```
jupyter notebook
```

## 方案 3：Anaconda

> **适用人群：** 适用人群： 初学者、学生、非技术背景用户。  
> **特点：** "开箱即用"，预装数百个库，无需配置，安装包巨大 (3GB+)。


### 1. 安装

1. 访问 [https://www.anaconda.com/download](https://www.anaconda.com/download)

2. 下载并安装（安装过程较长，请耐心等待）。

### 2. 启动 (图形界面)

无需输入代码，直接通过图形界面启动：
- 点击 Windows "开始" 菜单。
- 找到文件夹 Anaconda3。
- 点击 Jupyter Notebook 图标。
- 浏览器将自动打开，即可开始编写代码。

