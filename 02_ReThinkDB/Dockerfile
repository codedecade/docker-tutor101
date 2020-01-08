# Interaction ชื่อที่ต้องการสืบทอด:TAG
FROM debian:jessie

# Add the RethinkDB repository and public key
# "RethinkDB Packaging <packaging@rethinkdb.com>" http://download.rethinkdb.com/apt/pubkey.gpg

# -- Install Apps "rethinkdb"
RUN apt-key adv --keyserver keys.gnupg.net --recv-keys 3B87619DF812A63A8C1005C30742918E5C8DA04A

# -- สั่งไปเก็บที่ > Repository
RUN echo "deb http://download.rethinkdb.com/apt jessie main" > /etc/apt/sources.list.d/rethinkdb.list

# -- ประกาศตัวแปร เก็บ Version ที่จะใช้
ENV RETHINKDB_PACKAGE_VERSION 2.3.6~0jessie

# -- ทำการ Update Library และ ติดตั้ง App ตาม Version ที่เรากำหนดไว้ จากนั้นให้ทำการลบออกจากลิสใน Library
RUN apt-get update \
	&& apt-get install -y rethinkdb=$RETHINKDB_PACKAGE_VERSION \
	&& rm -rf /var/lib/apt/lists/*

# -- VOLUME คือ การเก็บรักษาข้อมูล ด้วยเทคโนโลยี ของ Docker
# -- หลักการ คือ สิ่งที่อยู่ใน Volume ก็จะถูกเก็บไว้ใน Host ของเราด้วย
# ที่อยู่ของ Volume: /var/lib/docker/volumes/repo/_data
VOLUME ["/data"]

# -- กำหนด Default Path ในการทำงาน Service ของเรา / 
WORKDIR /data

ENTRYPOINT [ "rethinkdb" ]

# -- สั่ง Command ให้ทำงานหลัง Run Container
# -- ในที่นี้คือ กำหนดให้ ทุกเครื่อง สามารถเข้าใช้งาน ThinkDB ได้ (ในการใช้งานจริงไม่แนะนำ เพราะไม่ปลอดภัย)
CMD ["--bind", "all"]

# -- กำหนด PORT ในการทำงาน ว่าสามารถใช้ PORT ไหนได้บ้าง // ถ้าเราไม่กำหนด EXPOSE จะใช้งานได้เฉพาะภายใน Docker เราเท่านั้น
EXPOSE 28015 29015 8080