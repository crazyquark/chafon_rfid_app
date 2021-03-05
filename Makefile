all: rfid_app idrw_linux p1d_rfid sycreader_set ctx-idrw-203

rfid_app: rfid_app.c 
	gcc -o rfid_app rfid_app.c

idrw_linux: idrw_linux.c
	gcc -o idrw_linux idrw_linux.c -I/usr/local/include -L. -lm -lc -L/usr/local/lib -lusb-1.0

p1d_rfid: p1d_rfid.c
	gcc p1d_rfid.c -o p1d_rfid

sycreader_set: sycreader_set.c
	gcc sycreader_set.c -o sycreader_set -I/usr/local/include -L. -lm -lc -L/usr/local/lib -lusb-1.0

ctx-idrw-203: ctx-idrw-203.c
	gcc ctx-idrw-203.c -O0 -g3 -o ctx-idrw-203 -I/usr/local/include -L. -lm -lc -L/usr/local/lib -lusb-1.0

clean:
	rm -f *.o rfid_app idrw_linux p1d_rfid sycreader_set ctx-idrw-203

install:
	cp 20-rwrfid.rules /etc/udev/rules.d/

