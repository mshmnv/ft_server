.PHONY: build run

build: 
	docker build -t server .

run:
	docker run -it -p 80:80 -p 443:443 server