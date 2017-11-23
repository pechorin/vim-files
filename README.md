# My Editor Environment (MyEE)

Простой скрипт для развертывания конфигов emacs и vim на любой osx машине.

## prerequirements
ruby && homebrew

## Как использовать

  ```
  git clone <repo> my_ee
  cd my_ee
 
  # установка редакторов && необходимых библиотек 
  bash ./run.sh install_toolset
  
  # если хотим создать бекап текущих home dir/files редакторов
  bash ./run.sh backup_home_dirs
  
  # создаем симлинки (предыдущии home dir/files будут удалены)
  bash ./run.sh install_symlinks
 
  # чтобы синхроинизировать свежие обновления с репозиторием (будет делать git pull --rebase перед каждым пушем)
  bash ./run.sh sync
  ```

## notes on emacs и vim
В основном конфиги настроены для работы с ruby/rust/js

- испольуем vim plug для менеджмента плагинов
- для emacs используем melpa, установка пакетов происходит сразу после старта emacs
