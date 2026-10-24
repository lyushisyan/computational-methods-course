# NEP-kappa: теплопроводность 3C-SiC / 3C-SiC 热导率计算

Практика к лекции 2. Команды выполняются в терминале Linux или WSL. На кластере расчёт запускают через Slurm.

第二讲实践。在 Linux 或 WSL 终端中执行命令；在集群上通过 Slurm 提交计算。

## 1. Установка / 安装

Создайте окружение Python 3.11 и установите NEP-kappa из исходного кода:

创建 Python 3.11 环境，从源码安装 NEP-kappa：

```bash
conda create -n nepkappa python=3.11
conda activate nepkappa
python --version
which python

cd ~
git clone https://github.com/lyushisyan/NEP-kappa.git
cd NEP-kappa
python -m pip install -e .

nepkappa --version
nepkappa --help
```

Если окружение и программа уже установлены, повторять установку не нужно: выполните `conda activate nepkappa`. При загрузке исходного кода через ZIP каталог обычно называется `NEP-kappa-main`; установку выполняют из каталога с `pyproject.toml`.

如果环境和程序已经安装，只需执行 `conda activate nepkappa`。如果通过 ZIP 下载源码，目录通常为 `NEP-kappa-main`；安装命令应在含有 `pyproject.toml` 的目录中执行。

## 2. Подготовка файлов / 准备文件

Откройте терминал **в каталоге `02-linux-nepkappa` этого курса**. Скопируйте готовую конфигурацию и скрипт Slurm в рабочий каталог, используемый в лекции:

**在本课程的 `02-linux-nepkappa` 文件夹中打开终端**，将配置和 Slurm 脚本复制到课件使用的工作目录：

```bash
mkdir -p ~/work/3C-SiC
cp input.yaml submit.slurm ~/work/3C-SiC/
cd ~/work/3C-SiC

src=~/NEP-kappa
cp "$src/examples/structures/3C-SiC/POSCAR_primitive" POSCAR
cp "$src/potentials/3C-SiC/nep_3C-SiC.txt" .
ls
```

Для исходного кода из ZIP задайте `src=~/NEP-kappa-main` перед копированием структуры и модели.

使用 ZIP 解压的源码时，复制结构和模型前改为 `src=~/NEP-kappa-main`。

| Файл / 文件 | Назначение / 用途 |
| --- | --- |
| `POSCAR` | Структура 3C-SiC / 3C-SiC 晶体结构 |
| `nep_3C-SiC.txt` | Модель потенциала NEP / NEP 势模型 |
| `input.yaml` | Параметры расчёта / 计算参数 |
| `submit.slurm` | Задание для кластера / 集群提交脚本 |

**Все следующие команды выполняются из `~/work/3C-SiC`.**

**后续命令均在 `~/work/3C-SiC` 中执行。**

## 3. Параметры / 计算参数

Файл [input.yaml](input.yaml) содержит полную конфигурацию примера из лекции. Пути к структуре и модели уже настроены для рабочего каталога.

[input.yaml](input.yaml) 是课件示例的完整配置，结构和势模型路径已按上述工作目录设置。

| Параметр / 参数 | Значение / 数值 |
| --- | --- |
| Оптимизация структуры / 结构优化 | `relaxation: true` |
| Суперячейки FC2 и FC3 / FC2、FC3 超胞 | `3 × 3 × 3` |
| Фононная сетка / 声子网格 | `31 × 31 × 31` |
| Температуры / 温度 | 100–1000 K, шаг / 步长 50 K |
| Расчёт переноса / 输运计算 | phono3py, RTA + Wigner |
| Изотопное рассеяние / 同位素散射 | `isotope: true` |
| Каталог результатов / 结果目录 | `results/` |

Для изменения параметров: `nano input.yaml`. Сохранить — **Ctrl+O**, затем Enter; выйти — **Ctrl+X**.

修改参数可用 `nano input.yaml`。**Ctrl+O**、Enter 保存，**Ctrl+X** 退出。

Для исследования материала проверяют применимость потенциала и сходимость по суперячейке и сетке.

用于材料研究时，需要检查势模型的适用性以及超胞、网格的收敛性。

## 4. Проверка и запуск / 检查与运行

Сначала проверьте параметры. Команда `info` не запускает расчёт:

先检查参数；`info` 不启动计算：

```bash
conda activate nepkappa
nepkappa info input.yaml
```

На рабочей станции Linux или в WSL запустите:

在 Linux 工作站或 WSL 中运行：

```bash
nepkappa run input.yaml
```

Этапы: `relax` → `fc2fc3` → `kappa`. При успешном завершении выводится `Completed: run`. Для подробного вывода можно запускать с `-v`: `nepkappa run input.yaml -v`.

执行顺序：结构优化 `relax` → 力常数 `fc2fc3` → 热导率 `kappa`。成功完成后显示 `Completed: run`。需要详细输出时，可在启动命令中加 `-v`：`nepkappa run input.yaml -v`。

Во время расчёта откройте другой терминал для просмотра журнала:

计算过程中，可在另一个终端查看日志：

```bash
cd ~/work/3C-SiC
tail -f results/run.log
```

**Ctrl+C** завершает просмотр журнала, не останавливая расчёт в первом терминале.

**Ctrl+C** 结束日志查看，不会停止第一个终端中的计算。

## 5. Результаты, графики и отчёт / 结果、图表与报告

После завершения расчёта выполните:

计算完成后执行：

```bash
ls -lh results
nepkappa plot input.yaml
nepkappa report input.yaml
```

| Путь / 路径 | Содержимое / 内容 |
| --- | --- |
| `results/POSCAR_relaxed` | Оптимизированная структура / 优化后的结构 |
| `results/fc2.hdf5`, `results/fc3.hdf5` | Силовые константы / 力常数 |
| `results/phono3py_disp.yaml` | Структура и смещения / 结构与位移信息 |
| `results/kappa-m313131.hdf5` | Данные теплопереноса / 热输运数据 |
| `results/force-jobs/` | Смещённые структуры и силы / 位移结构与原子力 |
| `results/run.log` | Журнал / 运行日志 |
| `results/provenance.yaml` | Параметры, версии и статус / 参数、版本与运行状态 |
| `results/plots/combined.png` | Составной рисунок / 综合图 |
| `results/report.md`, `results/report.yaml` | Сводный отчёт / 汇总报告 |

При `plot.layout: both` создаются общий рисунок и шесть отдельных графиков: дисперсия, плотность состояний, теплоёмкость, групповые скорости, скорости рассеяния и теплопроводность. Команды `plot` и `report` используют готовые результаты.

`plot.layout: both` 会生成综合图和六张单独图：声子色散、态密度、热容、群速度、散射率和热导率。`plot` 和 `report` 使用已有计算结果。

## 6. Меняем температуры / 修改温度范围

Чтобы сохранить первый набор результатов, сначала скопируйте каталог расчёта. В разделе `kappa` измените только строку:

如需保留第一次结果，先复制计算目录。在 `kappa` 部分仅修改温度行：

```yaml
  temps: [300, 600, 100]
```

Новые температуры: 300, 400, 500 и 600 K. При неизменных структуре, потенциале и параметрах силовых констант используйте готовые `fc2.hdf5`, `fc3.hdf5` и `phono3py_disp.yaml`:

新温度为 300、400、500、600 K。结构、势模型和力常数参数不变时，可复用已有的 `fc2.hdf5`、`fc3.hdf5` 和 `phono3py_disp.yaml`：

```bash
nepkappa info input.yaml
nepkappa kappa input.yaml
nepkappa plot input.yaml
nepkappa report input.yaml
```

## 7. Slurm / 集群提交

Подготовьте те же входные файлы и окружение на сервере. В [submit.slurm](submit.slurm) задайте свой путь к Conda. По умолчанию указан `~/miniconda3`; для Miniforge это может быть `~/miniforge3`.

在服务器上准备相同的输入文件和环境，并修改 [submit.slurm](submit.slurm) 中的 Conda 路径。默认是 `~/miniconda3`；使用 Miniforge 时可能为 `~/miniforge3`。

Скрипт запрашивает **1 узел, 1 задачу, 8 CPU, 16 GB памяти и 2 часа**. Ресурсы и, при необходимости, `--partition` / `--account` задаются по правилам кластера. Число потоков OpenMP и Rayon равно выделенным CPU; для OpenBLAS и MKL используется один поток.

脚本申请 **1 个节点、1 个任务、8 个 CPU、16 GB 内存和 2 小时**。资源以及必要的 `--partition` / `--account` 按集群要求修改。OpenMP、Rayon 线程数与申请的 CPU 数一致；OpenBLAS、MKL 使用单线程。

На сервере отправьте задание из каталога расчёта:

在服务器的计算目录中提交：

```bash
cd ~/work/3C-SiC
sbatch submit.slurm
squeue -u "$USER"
```

`PD` — ожидание ресурсов, `R` — выполнение. Для отмены: `scancel 123456`, где `123456` нужно заменить номером своего задания. После успешной отправки можно закрыть SSH-соединение.

`PD` 表示等待资源，`R` 表示正在运行。取消命令为 `scancel 123456`，将 `123456` 替换成自己的任务编号。成功提交后可以关闭 SSH 连接。

После завершения проверьте `nepkappa-ID.out`, `results/run.log` и результаты; затем выполните команды `plot` и `report` из раздела 5.

完成后检查 `nepkappa-ID.out`、`results/run.log` 及结果文件，再按第 5 节生成图表和报告。

Чтобы скачать рисунок, выполните **в локальном терминале**:

下载图片时，在**本地终端**执行：

```bash
scp user@server:~/work/3C-SiC/results/plots/combined.png \
    ~/Downloads/
```

Замените `user@server` своим именем пользователя и адресом сервера.

将 `user@server` 替换为自己的用户名和服务器地址。

## Материалы / 资料

- [NEP-kappa — исходный код / 源代码](https://github.com/lyushisyan/NEP-kappa)
- Основа практики: главы 1–3 руководства `NEP_kappa_Manual_202610_v3` и лекция 2 курса. / 实践依据：`NEP_kappa_Manual_202610_v3` 手册第 1–3 章及本课程第二讲课件。
