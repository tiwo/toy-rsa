KEY_BITS=256

default_targets=example.sec.txt example.sec.pem

all: ${default_targets}

%.sec.txt: %.sec.pem
	openssl rsa -text -in $< -out $@

%.pub.pem: %.sec.pem
	openssl rsa -pubout -in $< -out $@

%.sec.pem:
	openssl genpkey -algorithm RSA -out $@ \
		-pkeyopt rsa_keygen_bits:${KEY_BITS}
