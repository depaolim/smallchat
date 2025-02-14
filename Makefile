all: smallchat-server smallchat-client
CFLAGS=-O2 -Wall -W -std=c99

smallchat-server: smallchat-server.c chatlib.c
	$(CC) smallchat-server.c chatlib.c -o smallchat-server $(CFLAGS)

smallchat-client: smallchat-client.c chatlib.c
	$(CC) smallchat-client.c chatlib.c -o smallchat-client $(CFLAGS)

test: smallchat-server smallchat-client
	python3 -m unittest process.py -v
	python3 -m unittest tests.py -v

clean:
	rm -f smallchat-server
	rm -f smallchat-client
