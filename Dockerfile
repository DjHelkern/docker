FROM python:3.9-slim-buster

# Переменная среды, содержащая путь к нашей рабочей директории
ENV APP_HOME=/srv/app
# Создание директории приложения
RUN mkdir -p $APP_HOME
WORKDIR $APP_HOME

# Устанавливаем зависимости
RUN apt-get update && apt-get install -y libpq-dev gcc && \
    pip install --upgrade pip && \
    pip install flask psycopg2-binary configparser

# Запускаем наше приложение
CMD [ "python", "web.py" ]
