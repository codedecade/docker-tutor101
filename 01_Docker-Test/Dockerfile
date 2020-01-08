# Interaction ชื่อที่ต้องการสืบทอด:TAG
FROM debian:jessie

# Environment Variable | ตัวแปร | ค่าที่เก็บ
ENV text "Hello World I'm ENV."

# Run ตามด้วย Command คำสั่งที่ต้องการให้ทำ // คำสั่ง run จะทำงานขณะที่เรา build Image ไฟล์
RUN echo ${text}

# คล้ายคำสั่ง Run แต่เป็น Array // จะทำงานตอนเรา Run Image เป็น Container
# รูปแบบคำสั่ง [command, ค่าที่ต้องการทำ]
CMD ["echo","Hello I'm CMD"]