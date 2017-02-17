version = 2.25.0
bin = $(shell pwd)/resources/usr/bin

resources/usr/bin/bedtools: bedtools2/bin
	mkdir -p ${bin}
	cp bedtools2/bin/* ${bin}

bedtools2/bin/: bedtools2/
	cd bedtools2 && make

bedtools*.tar.gz:
	wget https://github.com/arq5x/bedtools2/releases/download/v${version}/bedtools-${version}.tar.gz

bedtools2/: bedtools*.tar.gz
	tar -zxvf bedtools-${version}.tar.gz

clean:
	rm -rf bedtools2* resources
