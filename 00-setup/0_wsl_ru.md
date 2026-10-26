# Установка WSL и Ubuntu

На занятии 2 используется терминал Ubuntu в Windows. Инструкция подходит для Windows 11 или Windows 10 версии 2004 (сборка 19041) и новее. Чтобы проверить версию системы, нажмите `Win + R` и введите `winver`.

## 1. Скачивание и установка

Найдите **PowerShell** в меню «Пуск», нажмите правой кнопкой мыши и выберите **Запуск от имени администратора**. Выполните:

```powershell
wsl --install
```

Команда установит WSL и дистрибутив Ubuntu по умолчанию. Отдельно скачивать ISO-образ Ubuntu не нужно. После завершения перезагрузите компьютер.

Если WSL и Ubuntu уже установлены, перейдите к проверке в разделе 3. Если установлен только WSL, добавьте Ubuntu из PowerShell с правами администратора:

```powershell
wsl --install -d Ubuntu
```

## 2. Первый запуск Ubuntu

После перезагрузки откройте **Ubuntu** через меню «Пуск» и дождитесь завершения инициализации. Задайте:

- имя пользователя Linux, например `student`;
- пароль и его подтверждение.

Это учётная запись Ubuntu; она может отличаться от учётной записи Windows. При вводе пароля символы и звёздочки не отображаются. Это нормально.

Приглашение такого вида означает, что вы вошли в Ubuntu:

```text
student@DESKTOP:~$
```

## 3. Проверка установки

Откройте новое окно **Windows PowerShell** и выполните:

```powershell
wsl -l -v
```

В списке должен быть дистрибутив `Ubuntu` со значением `2` в столбце `VERSION`. Состояние `Stopped` означает, что он сейчас не запущен, а не ошибку установки.

Если для ранее установленной Ubuntu указано `VERSION 1`, перейдите на WSL 2 по [инструкции Microsoft](https://learn.microsoft.com/en-us/windows/wsl/basic-commands#set-wsl-version-to-1-or-2). Сначала сохраните резервную копию важных данных, если они уже есть.

## 4. Как открывать Ubuntu в дальнейшем

Откройте **Ubuntu** через меню «Пуск» или выполните в PowerShell либо на вкладке PowerShell в Windows Terminal:

```powershell
wsl -d Ubuntu
```

Если в выводе `wsl -l -v` указано другое имя дистрибутива, замените `Ubuntu` в команде на это имя.

После входа в Ubuntu можно выполнить команды Linux:

```bash
pwd
uname -r
```

Для выхода из Ubuntu и возврата в терминал Windows:

```bash
exit
```

## 5. Если загрузка не проходит

Если установка остановилась на `0.0%`, попробуйте выполнить в PowerShell с правами администратора:

```powershell
wsl --install --web-download -d Ubuntu
```

Если появляется сообщение об отключённой виртуализации, проверьте настройки BIOS/UEFI по [инструкции Microsoft](https://learn.microsoft.com/en-us/windows/wsl/troubleshooting#installation-issues).

Python/Conda в Windows и среда Linux в Ubuntu устанавливаются отдельно. Для практики NEP-kappa подготовьте в Ubuntu окружение с Linux-версией Conda, затем следуйте [инструкции к занятию 2](../02-linux-nepkappa/README.md).

Источники: [установка WSL](https://learn.microsoft.com/en-us/windows/wsl/install), [первоначальная настройка](https://learn.microsoft.com/en-us/windows/wsl/setup/environment), [основные команды](https://learn.microsoft.com/en-us/windows/wsl/basic-commands).
