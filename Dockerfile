FROM python:3.12-slim
RUN groupadd -r groupdjango && useradd -r -g groupdjango userdj

ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

RUN pip install --upgrade pip
WORKDIR /app/www/sitewomen
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .
USER userdj


# FROM python:3.12-slim

# # Добавляем группу и пользователя
# RUN groupadd -r groupdjango && useradd -r -g groupdjango userdj

# # Устанавливаем переменные среды
# ENV PYTHONDONTWRITEBYTECODE=1
# ENV PYTHONUNBUFFERED=1

# # Обновляем пакеты и устанавливаем зависимости для psycopg2
# RUN apt-get update && apt-get install -y \
#     libpq-dev \
#     gcc \
#     python3-dev && \
#     rm -rf /var/lib/apt/lists/*

# # Обновляем pip
# RUN pip install --upgrade pip

# # Устанавливаем рабочую директорию
# WORKDIR /app/www/sitewomen

# # Копируем файлы зависимостей
# COPY requirements.txt .

# # Устанавливаем зависимости
# RUN pip install -r requirements.txt

# # Копируем остальные файлы
# COPY . .

# # Устанавливаем пользователя
# USER userdj