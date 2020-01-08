# Interaction ชื่อที่ต้องการสืบทอด:TAG
FROM php:5.6-apache

# -- ประกาศตัวแปร เก็บ สภาพแวดล้อม ที่จะใช้
ENV ENVIRONMENT production

# -- สร้างไฟล์ PHP.INI และกำหนด TimeZone เริ่มต้น
RUN echo "[PHP] \ndate.timezone = Asia/Bangkok" >> /usr/local/etc/php/php.ini

# -- ทำการ Update Library และ ติดตั้ง App ตาม Version ที่เรากำหนดไว้ จากนั้นให้ทำการลบออกจากลิสใน Library
RUN apt-get -y update \
    && apt-get install -y --no-install-recommends \
    libgd-dev \
    && rm -r /var/lib/apt/lists/*

# -- 
RUN docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/
RUN docker-php-ext-install mysqli gd

# -- เปิด Mode Rewrite
RUN a2enmod rewrite

# -- Coppy file ไปเก็บไว้ที่ Docker แทน Container เพื่อไม่ให้ไฟล์เสียหายเมื่อปิดเครื่อง
COPY ./index.php /var/www/html/index.php

# -- VOLUME คือ การเก็บรักษาข้อมูล ด้วยเทคโนโลยี ของ Docker
# -- หลักการ คือ สิ่งที่อยู่ใน Volume ก็จะถูกเก็บไว้ใน Host ของเราด้วย
# ที่อยู่ของ Volume: /var/lib/docker/volumes/repo/_data
VOLUME [ "/var/www/html" ]

# -- กำหนด PORT ในการทำงาน ว่าสามารถใช้ PORT ไหนได้บ้าง // ถ้าเราไม่กำหนด EXPOSE จะใช้งานได้เฉพาะภายใน Docker เราเท่านั้น
EXPOSE 80 443



